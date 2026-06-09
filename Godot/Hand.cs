using Godot;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using UrbaniaCore;

public partial class Hand : Node
{

	public List<Card> HeldCards { get; set; }
	public List<Card> Deck { get; set; }

	private CollisionShape2D _slotLeft;
	private CollisionShape2D _slotMiddle;
	private CollisionShape2D _slotRight;

	private PackedScene _cardScene = GD.Load<PackedScene>("res://card.tscn");


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		using (StreamReader r = new StreamReader("../Data/Cards.json"))
		{
			string cardJson = r.ReadToEnd();
            Deck = JsonSerializer.Deserialize<List<Card>>(cardJson);
        }

		GD.Print(Deck.Count);
		GD.Print(Deck[0].Name);

		_slotLeft = GetNode<CollisionShape2D>("CardArea/CollisionShape2D/Card");
		_slotMiddle = GetNode<CollisionShape2D>("CardArea/CollisionShape2D/Card2");
		_slotRight = GetNode<CollisionShape2D>("CardArea/CollisionShape2D/Card3");

		var scene = GD.Load<PackedScene>("res://card.tscn");
		var inst = scene.Instantiate<Area2D>();

    }

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
