using SLua;
using UnityEngine;

public class sproto_Test : MonoBehaviour
{

    LuaSvr l;

    // Use this for initialization
    void Start()
    {
        l = new LuaSvr();
        l.init(null, () =>
        {
            Debug.Log("---------sproto Test-----------");
            l.start("sprotoTest");

        },

        LuaSvrFlag.LSF_BASIC | LuaSvrFlag.LSF_EXTLIB | LuaSvrFlag.LSF_3RDDLL);
    }

    // Update is called once per frame
    void Update()
    {

    }
}
