using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

public class Script : MonoBehaviour {

    public TextAsset inkAsset;
    Story _inkStory;
    public Text MainText;
    public Button ChoiceButton0;
    public Button ChoiceButton1;


    void Awake()
    {
        _inkStory = new Story(inkAsset.text);
    }

    private void Update()
    {
        while (_inkStory.canContinue)
        {
            MainText.text = (_inkStory.Continue());
        }
        if (_inkStory.currentChoices.Count > 1)
        {
            Choice choice = _inkStory.currentChoices[0];
            ChoiceButton0.GetComponentInChildren<Text>().text = choice.text;
            choice = _inkStory.currentChoices[1];
            ChoiceButton1.GetComponentInChildren<Text>().text = choice.text;
        }
        
    }

    public void MakeChoise(int index)
    {
        _inkStory.ChooseChoiceIndex(index);
    }
}
