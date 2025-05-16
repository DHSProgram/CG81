    function Return_Case_ID(str) {
        const CS = new CSProActionInvoker("CheckID");
        CS.UI.closeDialog({ result: str});
    }
