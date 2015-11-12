%Module openpnl

namespace pnl {

%TypeHeaderCode
#include <pnlBNet.hpp>
#include <pnlDBN.hpp>
#include <pnlDynamicGraphicalModel.hpp>
#include <pnlDynamicInferenceEngine.hpp>
#include <pnlDynamicLearningEngine.hpp>
%End

class TokIdNode
{
  public:
    class Matcher
    {
      public:
        int imm;
        Matcher(int tag);
        Matcher();
        Matcher(Type type);
        Matcher(Type type, int tag);
    };

    static TokIdNode *root;
    static Vector< TokIdNode * > cemetery;

    TokIdNode();
    explicit TokIdNode(TokId);

    static std::pair< TokIdNode *, int > ResolveOne(const ResolveContext &resContext);

    String Name() const;

    void Remove(bool no_cemetery = false);
    void Kill();
    static void PurgeCemetery();

    Vector< TokId > id;
    int level; // root has level zero, invalid nodes have negative level
    int tag;
    void *data;

    TokIdNode *v_next;
    TokIdNode *v_prev;
    TokIdNode *h_next;
    TokIdNode *h_prev;

    // contains all descentants of that node for purposes of quick looking up
    typedef std::multimap< TokId, TokIdNode * > Map;
    Map desc;
};

class Tok
{
public:
    typedef TokIdNode::Matcher Matcher;

    static Tok root;
    static Tok nil;

    Tok();
    Tok(int);
    Tok(float);

    operator String() const;
    String Name() const;
    F FltValue(int) const;
    float FltValue() const;
    int IntValue() const;
};



class TokArr 
{
public:
    typedef Tok::Matcher Matcher;

    static TokArr nil;

    TokArr();

    static TokArr Span(int first, int last);

    typedef std::deque< Tok > Base;
};


void AddNode(TokArr nodes, TokArr subnodes);
void DelNode(TokArr nodes);
TokArr GetNodeType(TokArr nodes);
void AddArc(TokArr from, TokArr to);
void DelArc(TokArr from, TokArr to);
TokArr GetNeighbours(TokArr nodes);
TokArr GetParents(TokArr nodes);
TokArr GetChildren(TokArr nodes);
int GetNumSlives();
void SetNumSlices(int nSlives);
void SetPTabular(TokArr value, TokArr prob, TokArr parentValue = TokArr());
TokArr GetPTabular(TokArr node, TokArr parents = TokArr());
pnl::pEvidencesVecVector GetPNLEvidences();
pnl::CDynamicInfEngine &Inference();
pnl::CDynamicLearningEngine &Learning();
pnl::CDBN &Model();
void SetPGaussian(TokArr var, TokArr mean = TokArr(), TokArr variance = TokArr(), TokArr weight = TokArr());
void EditEvidence(TokArr values);
void ClearEvid();
void CurEvidToBuf();
void AddEvidToBuf(TokArr values);
void ClearEvidBuf();
void MaskEvidBuf(TokArr whatNodes = "");
void LearnParameters();
float GetEMLearningCriterionValue();
TokArr GetMPE(TokArr nodes);
TokArr GetJPD(TokArr nodes);
void SetProperty(const char *name, const char *value);
String GetProperty(const char *name) const;
TokArr GetGaussianMean(TokArr node);
TokArr GetGaussianCovar(TokArr node);
BayesNet* Unroll();
void SaveNet(const char *filename);
int SaveEvidBuf(const char *filename, NetConst::ESavingType mode = NetConst::eCSV);
void LoadNet(const char *filename);
int LoadEvidBuf(const char *filename,
                NetConst::ESavingType mode = NetConst::eCSV,
                TokArr columns = TokArr());
void GenerateEvidences(TokArr nEvSlices);


};
