import 'package:flutter/material.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/modals/coin_model.dart';
import 'package:swap_app/modals/history_model.dart';

List<Coin> coins = [
  Coin(
      name: "ETH",
      value: 3102.39,
      image: eth,
      backgroundColor: const Color(0xFF8A92B2)),
  Coin(
      name: "BNB",
      value: 425.72,
      image: bnb,
      backgroundColor: const Color(0xFFF3BA2F)),
  Coin(
      name: "BCH",
      value: 19212.78,
      image: bch,
      backgroundColor: const Color(0xFF0AC18E)),
  Coin(
      name: "BTC",
      value: 19212.78,
      image: btc,
      backgroundColor: const Color(0xFFF7931A)),
  Coin(
      name: "DASH",
      value: 2290.34,
      image: dash,
      backgroundColor: const Color(0xFF008DE4)),
  Coin(
      name: "DOGE",
      value: 5.34,
      image: doge,
      backgroundColor: const Color(0xFF988430)),
  Coin(
      name: "LTC",
      value: 5.34,
      image: ltc,
      backgroundColor: const Color(0xFF345D9D)),
  Coin(
      name: "TRX",
      value: 5.34,
      image: trx,
      backgroundColor: const Color(0xFFFA2E02)),
  Coin(
      name: "USDTERC",
      value: 256.34,
      image: usdterc,
      backgroundColor: const Color(0xFF50AF95)),
  Coin(
      name: "USDTTRC",
      value: 654.34,
      image: usdttrc,
      backgroundColor: const Color(0xFF50AF95)),
  Coin(
      name: "XMR",
      value: 4789.34,
      image: xmr,
      backgroundColor: const Color(0xFFF26822)),
];

List<HistoryModel> walletHistory = [
  HistoryModel(
      date: "1",
      status: 1,
      id: "620cd34574f0887874104832",
      coin1: Coin(
          name: "DASH",
          value: 2290.34,
          image: dash,
          backgroundColor: const Color(0xFF008DE4)),
      coin2: Coin(
          name: "DOGE",
          value: 5.34,
          image: doge,
          backgroundColor: const Color(0xFF988430)),
      transaction: "0xf6633324f25d6d4ed874",
      walletName: "Coinbase"),
  HistoryModel(
      date: "3",
      status: 2,
      id: "620cd34574f0887874104832",
      coin1: Coin(
          name: "USDTTRC",
          value: 654.34,
          image: usdttrc,
          backgroundColor: const Color(0xFF50AF95)),
      coin2: Coin(
          name: "XMR",
          value: 4789.34,
          image: xmr,
          backgroundColor: const Color(0xFFF26822)),
      transaction: "0xf6633324f25d6d4ed874",
      walletName: "Coinbase"),
  HistoryModel(
      date: "5",
      status: 0,
      id: "620cd34574f0887874104832",
      coin1: Coin(
          name: "DOGE",
          value: 5.34,
          image: doge,
          backgroundColor: const Color(0xFF988430)),
      coin2: Coin(
          name: "LTC",
          value: 5.34,
          image: ltc,
          backgroundColor: const Color(0xFF345D9D)),
      transaction: "0xf6633324f25d6d4ed874",
      walletName: "Coinbase")
];
