Return-Path: <linux-doc+bounces-14289-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B228A6350
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 07:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C2C282950
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 05:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3950C3E493;
	Tue, 16 Apr 2024 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kTgvdK/P"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8503D0AD;
	Tue, 16 Apr 2024 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247014; cv=none; b=XwnUfj5t+GGDoptp0wweW/xD5dOQdtdIPIjxv1yLwWcfZ1fM6kNAobU41I7XsjS3n3v9nocyxam0EmvnTxjRV61jIhY5FYbQaAIpY6yU2vy2VNYC8HeYevFXa9mZNGAmWmmnuBCEAErTp89mXDE6L1CZSah+EkfCBjUJ05Au0m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247014; c=relaxed/simple;
	bh=QSttxf2tdQ8YO22IswUuFFPjaAZvLWVVjPYsQMuF3DQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EN7MStxhDxQMw0jmBQiE6euz+ZcyiQzVHnt4aBMgJmbCxOYSbjbIo6MHBBME72Jk3tn0Y6dxtlFPFkGrPUgO2JXLpfC0betDoUp61OP0K4LLdFQlu/L7AD4iPeMfFnmp/xras3uM4LKL+fsSD9KSJrUo5SaDRR3EN1xeLx2lyQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kTgvdK/P; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 053BB24000A;
	Tue, 16 Apr 2024 05:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713247009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Abaex5aksLB1anO0DJAYWX8f1sHqRSGhAgoBmASUQT8=;
	b=kTgvdK/P72DnqbMQcPPVZ4IDlJ136cKuA6OL2zq1ej3PAIfZ3kawf/L6W+nfxhpmbqRSvC
	mF5BpNcBbMws/b0F5VxLrATwEs6wQIRSnxEzq8HJaS2bkZDBJJr6PlDy769ZmoJ+myI3iQ
	MsXAjAeGvi1qYuVT/0GG5mfwIam+IdDeR2OaoQfOqE8i+wRJo4q+RC2d4KjxhUZs0nzQUW
	7jB0Pk9H8bBDHRV5mMzSFbNmZszfKVJ/is3plE2mC2myMGLiPA7Stzgc1+Dk7licWAQu5h
	4OjZ7ncD2vLZrGhXo2aQOmrh40+7hXHlNdJeeKjl0LaIuQFqTy8I0wGQ/J6Tlw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Apr 2024 07:56:13 +0200
Subject: [PATCH 07/12] ASoC: doc: dapm: extend initial descrption
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-dapm-docs-v1-7-a818d2819bf6@bootlin.com>
References: <20240416-dapm-docs-v1-0-a818d2819bf6@bootlin.com>
In-Reply-To: <20240416-dapm-docs-v1-0-a818d2819bf6@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com

Extend the initial description providing clearer definitions of "widget"
and "route", and to stop using the word "component" to mean "widget". Give
more details and clarify wording and add a picture representing a real DAPM
graph.

Group all the introductory paragraphs before the "DAPM power domains", and
split the latter to a specific section.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/sound/soc/dapm-graph.svg | 375 +++++++++++++++++++++++++++++++++
 Documentation/sound/soc/dapm.rst       |  30 ++-
 2 files changed, 396 insertions(+), 9 deletions(-)

diff --git a/Documentation/sound/soc/dapm-graph.svg b/Documentation/sound/soc/dapm-graph.svg
new file mode 100644
index 000000000000..d783672db815
--- /dev/null
+++ b/Documentation/sound/soc/dapm-graph.svg
@@ -0,0 +1,375 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
+ "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
+<!-- Generated by graphviz version 2.43.0 (0)
+ -->
+<!-- Title: G Pages: 1 -->
+<svg width="900pt" height="630pt"
+ viewBox="0.00 0.00 900.00 630.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
+<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 626)">
+<title>G</title>
+<polygon fill="white" stroke="transparent" points="-4,4 -4,-626 896,-626 896,4 -4,4"/>
+<g id="clust1" class="cluster">
+<title>ROOT</title>
+<polygon fill="none" stroke="dodgerblue" points="8,-537 8,-614 102,-614 102,-537 8,-537"/>
+<text text-anchor="middle" x="55" y="-598.8" font-family="sans-serif" font-size="14.00">ROOT</text>
+</g>
+<g id="clust2" class="cluster">
+<title>4000b000.audio&#45;controller</title>
+<polygon fill="none" stroke="dodgerblue" points="120,-378 120,-455 312,-455 312,-378 120,-378"/>
+<text text-anchor="middle" x="216" y="-439.8" font-family="sans-serif" font-size="14.00">4000b000.audio&#45;controller</text>
+</g>
+<g id="clust5" class="cluster">
+<title>cs42l51.0&#45;004a</title>
+<polygon fill="none" stroke="dodgerblue" points="330,-8 330,-614 884,-614 884,-8 330,-8"/>
+<text text-anchor="middle" x="607" y="-598.8" font-family="sans-serif" font-size="14.00">cs42l51.0&#45;004a</text>
+</g>
+<g id="clust9" class="cluster">
+<title>hdmi&#45;audio&#45;codec.1.auto</title>
+<polygon fill="none" stroke="dodgerblue" points="110,-463 110,-614 314,-614 314,-463 110,-463"/>
+<text text-anchor="middle" x="212" y="-598.8" font-family="sans-serif" font-size="14.00">hdmi&#45;audio&#45;codec.1.auto</text>
+</g>
+<!-- ROOT_Amplifier -->
+<g id="node1" class="node">
+<title>ROOT_Amplifier</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="93.5,-583 16.5,-583 16.5,-545 93.5,-545 93.5,-583"/>
+<text text-anchor="middle" x="55" y="-567.8" font-family="sans-serif" font-size="14.00">Amplifier</text>
+<text text-anchor="middle" x="55" y="-552.8" font-family="sans-serif" font-size="14.00">[out_drv]</text>
+</g>
+<!-- 4000b000.audio&#45;controller_capture -->
+<g id="node2" class="node">
+<title>4000b000.audio&#45;controller_capture</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="202,-424 128,-424 128,-386 202,-386 202,-424"/>
+<text text-anchor="middle" x="165" y="-408.8" font-family="sans-serif" font-size="14.00">capture</text>
+<text text-anchor="middle" x="165" y="-393.8" font-family="sans-serif" font-size="14.00">[dai_out]</text>
+</g>
+<!-- 4000b000.audio&#45;controller_playback -->
+<g id="node3" class="node">
+<title>4000b000.audio&#45;controller_playback</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="304,-424 230,-424 230,-386 304,-386 304,-424"/>
+<text text-anchor="middle" x="267" y="-408.8" font-family="sans-serif" font-size="14.00">playback</text>
+<text text-anchor="middle" x="267" y="-393.8" font-family="sans-serif" font-size="14.00">[dai_in]</text>
+</g>
+<!-- hdmi&#45;audio&#45;codec.1.auto_I2S Playback -->
+<g id="node28" class="node">
+<title>hdmi&#45;audio&#45;codec.1.auto_I2S Playback</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="306,-583 208,-583 208,-545 306,-545 306,-583"/>
+<text text-anchor="middle" x="257" y="-567.8" font-family="sans-serif" font-size="14.00">I2S Playback</text>
+<text text-anchor="middle" x="257" y="-552.8" font-family="sans-serif" font-size="14.00">[dai_in]</text>
+</g>
+<!-- 4000b000.audio&#45;controller_playback&#45;&gt;hdmi&#45;audio&#45;codec.1.auto_I2S Playback -->
+<g id="edge21" class="edge">
+<title>4000b000.audio&#45;controller_playback&#45;&gt;hdmi&#45;audio&#45;codec.1.auto_I2S Playback</title>
+<path fill="none" stroke="black" d="M276.84,-424.14C282.19,-435.06 288.26,-449.42 291,-463 295.05,-483.04 296.67,-489.36 291,-509 288.25,-518.54 283.26,-528.01 277.93,-536.3"/>
+<polygon fill="black" stroke="black" points="274.89,-534.55 272.11,-544.78 280.66,-538.51 274.89,-534.55"/>
+</g>
+<!-- hdmi&#45;audio&#45;codec.1.auto_Capture -->
+<g id="node4" class="node">
+<title>hdmi&#45;audio&#45;codec.1.auto_Capture</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="192,-509 118,-509 118,-471 192,-471 192,-509"/>
+<text text-anchor="middle" x="155" y="-493.8" font-family="sans-serif" font-size="14.00">Capture</text>
+<text text-anchor="middle" x="155" y="-478.8" font-family="sans-serif" font-size="14.00">[dai_out]</text>
+</g>
+<!-- hdmi&#45;audio&#45;codec.1.auto_Capture&#45;&gt;4000b000.audio&#45;controller_capture -->
+<g id="edge1" class="edge">
+<title>hdmi&#45;audio&#45;codec.1.auto_Capture&#45;&gt;4000b000.audio&#45;controller_capture</title>
+<path fill="none" stroke="black" d="M157.17,-470.99C158.46,-460.3 160.12,-446.5 161.58,-434.37"/>
+<polygon fill="black" stroke="black" points="165.08,-434.61 162.8,-424.26 158.13,-433.77 165.08,-434.61"/>
+</g>
+<!-- cs42l51.0&#45;004a_AIN1L -->
+<g id="node5" class="node">
+<title>cs42l51.0&#45;004a_AIN1L</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="836.5,-583 775.5,-583 775.5,-545 836.5,-545 836.5,-583"/>
+<text text-anchor="middle" x="806" y="-567.8" font-family="sans-serif" font-size="14.00">AIN1L</text>
+<text text-anchor="middle" x="806" y="-552.8" font-family="sans-serif" font-size="14.00">[input]</text>
+</g>
+<!-- cs42l51.0&#45;004a_PGA&#45;ADC Mux Left -->
+<g id="node22" class="node">
+<title>cs42l51.0&#45;004a_PGA&#45;ADC Mux Left</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="876,-509 736,-509 736,-471 876,-471 876,-509"/>
+<text text-anchor="middle" x="806" y="-493.8" font-family="sans-serif" font-size="14.00">PGA&#45;ADC Mux Left</text>
+<text text-anchor="middle" x="806" y="-478.8" font-family="sans-serif" font-size="14.00">[mux]</text>
+</g>
+<!-- cs42l51.0&#45;004a_AIN1L&#45;&gt;cs42l51.0&#45;004a_PGA&#45;ADC Mux Left -->
+<g id="edge14" class="edge">
+<title>cs42l51.0&#45;004a_AIN1L&#45;&gt;cs42l51.0&#45;004a_PGA&#45;ADC Mux Left</title>
+<path fill="none" stroke="black" d="M806,-544.83C806,-537.13 806,-527.97 806,-519.42"/>
+<polygon fill="black" stroke="black" points="809.5,-519.41 806,-509.41 802.5,-519.41 809.5,-519.41"/>
+</g>
+<!-- cs42l51.0&#45;004a_AIN1R -->
+<g id="node6" class="node">
+<title>cs42l51.0&#45;004a_AIN1R</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="738.5,-583 677.5,-583 677.5,-545 738.5,-545 738.5,-583"/>
+<text text-anchor="middle" x="708" y="-567.8" font-family="sans-serif" font-size="14.00">AIN1R</text>
+<text text-anchor="middle" x="708" y="-552.8" font-family="sans-serif" font-size="14.00">[input]</text>
+</g>
+<!-- cs42l51.0&#45;004a_PGA&#45;ADC Mux Right -->
+<g id="node23" class="node">
+<title>cs42l51.0&#45;004a_PGA&#45;ADC Mux Right</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="717.5,-509 568.5,-509 568.5,-471 717.5,-471 717.5,-509"/>
+<text text-anchor="middle" x="643" y="-493.8" font-family="sans-serif" font-size="14.00">PGA&#45;ADC Mux Right</text>
+<text text-anchor="middle" x="643" y="-478.8" font-family="sans-serif" font-size="14.00">[mux]</text>
+</g>
+<!-- cs42l51.0&#45;004a_AIN1R&#45;&gt;cs42l51.0&#45;004a_PGA&#45;ADC Mux Right -->
+<g id="edge15" class="edge">
+<title>cs42l51.0&#45;004a_AIN1R&#45;&gt;cs42l51.0&#45;004a_PGA&#45;ADC Mux Right</title>
+<path fill="none" stroke="black" d="M691.6,-544.83C683.96,-536.37 674.73,-526.15 666.38,-516.9"/>
+<polygon fill="black" stroke="black" points="668.92,-514.49 659.62,-509.41 663.73,-519.18 668.92,-514.49"/>
+</g>
+<!-- cs42l51.0&#45;004a_AIN2L -->
+<g id="node7" class="node">
+<title>cs42l51.0&#45;004a_AIN2L</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="659.5,-583 598.5,-583 598.5,-545 659.5,-545 659.5,-583"/>
+<text text-anchor="middle" x="629" y="-567.8" font-family="sans-serif" font-size="14.00">AIN2L</text>
+<text text-anchor="middle" x="629" y="-552.8" font-family="sans-serif" font-size="14.00">[input]</text>
+</g>
+<!-- cs42l51.0&#45;004a_AIN2R -->
+<g id="node8" class="node">
+<title>cs42l51.0&#45;004a_AIN2R</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="580.5,-583 519.5,-583 519.5,-545 580.5,-545 580.5,-583"/>
+<text text-anchor="middle" x="550" y="-567.8" font-family="sans-serif" font-size="14.00">AIN2R</text>
+<text text-anchor="middle" x="550" y="-552.8" font-family="sans-serif" font-size="14.00">[input]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Capture -->
+<g id="node9" class="node">
+<title>cs42l51.0&#45;004a_Capture</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="692,-276 618,-276 618,-238 692,-238 692,-276"/>
+<text text-anchor="middle" x="655" y="-260.8" font-family="sans-serif" font-size="14.00">Capture</text>
+<text text-anchor="middle" x="655" y="-245.8" font-family="sans-serif" font-size="14.00">[dai_out]</text>
+</g>
+<!-- cs42l51.0&#45;004a_DAC Mux -->
+<g id="node10" class="node">
+<title>cs42l51.0&#45;004a_DAC Mux</title>
+<polygon fill="none" stroke="#008b00" stroke-width="2" points="598.5,-202 521.5,-202 521.5,-164 598.5,-164 598.5,-202"/>
+<text text-anchor="middle" x="560" y="-186.8" font-family="sans-serif" font-size="14.00">DAC Mux</text>
+<text text-anchor="middle" x="560" y="-171.8" font-family="sans-serif" font-size="14.00">[mux]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Left DAC -->
+<g id="node14" class="node">
+<title>cs42l51.0&#45;004a_Left DAC</title>
+<polygon fill="none" stroke="#008b00" stroke-width="2" points="548,-128 474,-128 474,-90 548,-90 548,-128"/>
+<text text-anchor="middle" x="511" y="-112.8" font-family="sans-serif" font-size="14.00">Left DAC</text>
+<text text-anchor="middle" x="511" y="-97.8" font-family="sans-serif" font-size="14.00">[dac]</text>
+</g>
+<!-- cs42l51.0&#45;004a_DAC Mux&#45;&gt;cs42l51.0&#45;004a_Left DAC -->
+<g id="edge9" class="edge">
+<title>cs42l51.0&#45;004a_DAC Mux&#45;&gt;cs42l51.0&#45;004a_Left DAC</title>
+<path fill="none" stroke="black" d="M547.64,-163.83C542.05,-155.62 535.34,-145.76 529.19,-136.73"/>
+<polygon fill="black" stroke="black" points="532.05,-134.71 523.53,-128.41 526.26,-138.65 532.05,-134.71"/>
+</g>
+<!-- cs42l51.0&#45;004a_Right DAC -->
+<g id="node26" class="node">
+<title>cs42l51.0&#45;004a_Right DAC</title>
+<polygon fill="none" stroke="#008b00" stroke-width="2" points="649.5,-128 566.5,-128 566.5,-90 649.5,-90 649.5,-128"/>
+<text text-anchor="middle" x="608" y="-112.8" font-family="sans-serif" font-size="14.00">Right DAC</text>
+<text text-anchor="middle" x="608" y="-97.8" font-family="sans-serif" font-size="14.00">[dac]</text>
+</g>
+<!-- cs42l51.0&#45;004a_DAC Mux&#45;&gt;cs42l51.0&#45;004a_Right DAC -->
+<g id="edge18" class="edge">
+<title>cs42l51.0&#45;004a_DAC Mux&#45;&gt;cs42l51.0&#45;004a_Right DAC</title>
+<path fill="none" stroke="black" d="M572.11,-163.83C577.53,-155.71 584.02,-145.96 589.99,-137.01"/>
+<polygon fill="black" stroke="black" points="593.09,-138.68 595.72,-128.41 587.27,-134.79 593.09,-138.68"/>
+</g>
+<!-- cs42l51.0&#45;004a_HPL -->
+<g id="node11" class="node">
+<title>cs42l51.0&#45;004a_HPL</title>
+<polygon fill="none" stroke="#008b00" stroke-width="2" points="546.5,-54 475.5,-54 475.5,-16 546.5,-16 546.5,-54"/>
+<text text-anchor="middle" x="511" y="-38.8" font-family="sans-serif" font-size="14.00">HPL</text>
+<text text-anchor="middle" x="511" y="-23.8" font-family="sans-serif" font-size="14.00">[output]</text>
+</g>
+<!-- cs42l51.0&#45;004a_HPR -->
+<g id="node12" class="node">
+<title>cs42l51.0&#45;004a_HPR</title>
+<polygon fill="none" stroke="#008b00" stroke-width="2" points="643.5,-54 572.5,-54 572.5,-16 643.5,-16 643.5,-54"/>
+<text text-anchor="middle" x="608" y="-38.8" font-family="sans-serif" font-size="14.00">HPR</text>
+<text text-anchor="middle" x="608" y="-23.8" font-family="sans-serif" font-size="14.00">[output]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Left ADC -->
+<g id="node13" class="node">
+<title>cs42l51.0&#45;004a_Left ADC</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="822,-350 748,-350 748,-312 822,-312 822,-350"/>
+<text text-anchor="middle" x="785" y="-334.8" font-family="sans-serif" font-size="14.00">Left ADC</text>
+<text text-anchor="middle" x="785" y="-319.8" font-family="sans-serif" font-size="14.00">[adc]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Left ADC&#45;&gt;cs42l51.0&#45;004a_Capture -->
+<g id="edge4" class="edge">
+<title>cs42l51.0&#45;004a_Left ADC&#45;&gt;cs42l51.0&#45;004a_Capture</title>
+<path fill="none" stroke="black" d="M752.2,-311.83C735.41,-302.54 714.8,-291.12 696.88,-281.2"/>
+<polygon fill="black" stroke="black" points="698.24,-277.95 687.79,-276.16 694.85,-284.07 698.24,-277.95"/>
+</g>
+<!-- cs42l51.0&#45;004a_Left DAC&#45;&gt;cs42l51.0&#45;004a_HPL -->
+<g id="edge6" class="edge">
+<title>cs42l51.0&#45;004a_Left DAC&#45;&gt;cs42l51.0&#45;004a_HPL</title>
+<path fill="none" stroke="black" d="M511,-89.83C511,-82.13 511,-72.97 511,-64.42"/>
+<polygon fill="black" stroke="black" points="514.5,-64.41 511,-54.41 507.5,-64.41 514.5,-64.41"/>
+</g>
+<!-- cs42l51.0&#45;004a_Left PGA -->
+<g id="node15" class="node">
+<title>cs42l51.0&#45;004a_Left PGA</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="838,-424 764,-424 764,-386 838,-386 838,-424"/>
+<text text-anchor="middle" x="801" y="-408.8" font-family="sans-serif" font-size="14.00">Left PGA</text>
+<text text-anchor="middle" x="801" y="-393.8" font-family="sans-serif" font-size="14.00">[pga]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Left PGA&#45;&gt;cs42l51.0&#45;004a_Left ADC -->
+<g id="edge8" class="edge">
+<title>cs42l51.0&#45;004a_Left PGA&#45;&gt;cs42l51.0&#45;004a_Left ADC</title>
+<path fill="none" stroke="black" d="M796.96,-385.83C795.25,-378.13 793.22,-368.97 791.31,-360.42"/>
+<polygon fill="black" stroke="black" points="794.68,-359.42 789.09,-350.41 787.84,-360.93 794.68,-359.42"/>
+</g>
+<!-- cs42l51.0&#45;004a_MCLK -->
+<g id="node16" class="node">
+<title>cs42l51.0&#45;004a_MCLK</title>
+<polygon fill="none" stroke="#008b00" stroke-width="2" points="594.5,-350 525.5,-350 525.5,-312 594.5,-312 594.5,-350"/>
+<text text-anchor="middle" x="560" y="-334.8" font-family="sans-serif" font-size="14.00">MCLK</text>
+<text text-anchor="middle" x="560" y="-319.8" font-family="sans-serif" font-size="14.00">[supply]</text>
+</g>
+<!-- cs42l51.0&#45;004a_MCLK&#45;&gt;cs42l51.0&#45;004a_Capture -->
+<g id="edge2" class="edge">
+<title>cs42l51.0&#45;004a_MCLK&#45;&gt;cs42l51.0&#45;004a_Capture</title>
+<path fill="none" stroke="black" d="M583.97,-311.83C595.79,-302.88 610.2,-291.96 622.94,-282.3"/>
+<polygon fill="black" stroke="black" points="625.18,-284.99 631.04,-276.16 620.95,-279.41 625.18,-284.99"/>
+</g>
+<!-- cs42l51.0&#45;004a_Playback -->
+<g id="node24" class="node">
+<title>cs42l51.0&#45;004a_Playback</title>
+<polygon fill="none" stroke="#008b00" stroke-width="2" points="597,-276 523,-276 523,-238 597,-238 597,-276"/>
+<text text-anchor="middle" x="560" y="-260.8" font-family="sans-serif" font-size="14.00">Playback</text>
+<text text-anchor="middle" x="560" y="-245.8" font-family="sans-serif" font-size="14.00">[dai_in]</text>
+</g>
+<!-- cs42l51.0&#45;004a_MCLK&#45;&gt;cs42l51.0&#45;004a_Playback -->
+<g id="edge16" class="edge">
+<title>cs42l51.0&#45;004a_MCLK&#45;&gt;cs42l51.0&#45;004a_Playback</title>
+<path fill="none" stroke="black" d="M560,-311.83C560,-304.13 560,-294.97 560,-286.42"/>
+<polygon fill="black" stroke="black" points="563.5,-286.41 560,-276.41 556.5,-286.41 563.5,-286.41"/>
+</g>
+<!-- cs42l51.0&#45;004a_MICL -->
+<g id="node17" class="node">
+<title>cs42l51.0&#45;004a_MICL</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="399.5,-509 338.5,-509 338.5,-471 399.5,-471 399.5,-509"/>
+<text text-anchor="middle" x="369" y="-493.8" font-family="sans-serif" font-size="14.00">MICL</text>
+<text text-anchor="middle" x="369" y="-478.8" font-family="sans-serif" font-size="14.00">[input]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Mic Preamp Left -->
+<g id="node20" class="node">
+<title>cs42l51.0&#45;004a_Mic Preamp Left</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="461.5,-424 338.5,-424 338.5,-386 461.5,-386 461.5,-424"/>
+<text text-anchor="middle" x="400" y="-408.8" font-family="sans-serif" font-size="14.00">Mic Preamp Left</text>
+<text text-anchor="middle" x="400" y="-393.8" font-family="sans-serif" font-size="14.00">[mixer]</text>
+</g>
+<!-- cs42l51.0&#45;004a_MICL&#45;&gt;cs42l51.0&#45;004a_Mic Preamp Left -->
+<g id="edge12" class="edge">
+<title>cs42l51.0&#45;004a_MICL&#45;&gt;cs42l51.0&#45;004a_Mic Preamp Left</title>
+<path fill="none" stroke="black" d="M375.73,-470.99C379.8,-460.08 385.08,-445.94 389.68,-433.64"/>
+<polygon fill="black" stroke="black" points="392.96,-434.85 393.18,-424.26 386.4,-432.4 392.96,-434.85"/>
+</g>
+<!-- cs42l51.0&#45;004a_MICR -->
+<g id="node18" class="node">
+<title>cs42l51.0&#45;004a_MICR</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="501.5,-583 440.5,-583 440.5,-545 501.5,-545 501.5,-583"/>
+<text text-anchor="middle" x="471" y="-567.8" font-family="sans-serif" font-size="14.00">MICR</text>
+<text text-anchor="middle" x="471" y="-552.8" font-family="sans-serif" font-size="14.00">[input]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Mic Preamp Right -->
+<g id="node21" class="node">
+<title>cs42l51.0&#45;004a_Mic Preamp Right</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="550.5,-509 417.5,-509 417.5,-471 550.5,-471 550.5,-509"/>
+<text text-anchor="middle" x="484" y="-493.8" font-family="sans-serif" font-size="14.00">Mic Preamp Right</text>
+<text text-anchor="middle" x="484" y="-478.8" font-family="sans-serif" font-size="14.00">[mixer]</text>
+</g>
+<!-- cs42l51.0&#45;004a_MICR&#45;&gt;cs42l51.0&#45;004a_Mic Preamp Right -->
+<g id="edge13" class="edge">
+<title>cs42l51.0&#45;004a_MICR&#45;&gt;cs42l51.0&#45;004a_Mic Preamp Right</title>
+<path fill="none" stroke="black" d="M474.28,-544.83C475.67,-537.13 477.32,-527.97 478.87,-519.42"/>
+<polygon fill="black" stroke="black" points="482.34,-519.88 480.68,-509.41 475.45,-518.63 482.34,-519.88"/>
+</g>
+<!-- cs42l51.0&#45;004a_Mic Bias -->
+<g id="node19" class="node">
+<title>cs42l51.0&#45;004a_Mic Bias</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="409.5,-583 338.5,-583 338.5,-545 409.5,-545 409.5,-583"/>
+<text text-anchor="middle" x="374" y="-567.8" font-family="sans-serif" font-size="14.00">Mic Bias</text>
+<text text-anchor="middle" x="374" y="-552.8" font-family="sans-serif" font-size="14.00">[supply]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Mic Bias&#45;&gt;cs42l51.0&#45;004a_MICL -->
+<g id="edge11" class="edge">
+<title>cs42l51.0&#45;004a_Mic Bias&#45;&gt;cs42l51.0&#45;004a_MICL</title>
+<path fill="none" stroke="black" d="M372.74,-544.83C372.2,-537.13 371.57,-527.97 370.97,-519.42"/>
+<polygon fill="black" stroke="black" points="374.46,-519.15 370.28,-509.41 367.48,-519.63 374.46,-519.15"/>
+</g>
+<!-- cs42l51.0&#45;004a_PGA&#45;ADC Mux Left&#45;&gt;cs42l51.0&#45;004a_Left PGA -->
+<g id="edge10" class="edge">
+<title>cs42l51.0&#45;004a_PGA&#45;ADC Mux Left&#45;&gt;cs42l51.0&#45;004a_Left PGA</title>
+<path fill="none" stroke="black" d="M804.92,-470.99C804.27,-460.3 803.44,-446.5 802.71,-434.37"/>
+<polygon fill="black" stroke="black" points="806.2,-434.03 802.1,-424.26 799.21,-434.45 806.2,-434.03"/>
+</g>
+<!-- cs42l51.0&#45;004a_Right PGA -->
+<g id="node27" class="node">
+<title>cs42l51.0&#45;004a_Right PGA</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="688.5,-424 605.5,-424 605.5,-386 688.5,-386 688.5,-424"/>
+<text text-anchor="middle" x="647" y="-408.8" font-family="sans-serif" font-size="14.00">Right PGA</text>
+<text text-anchor="middle" x="647" y="-393.8" font-family="sans-serif" font-size="14.00">[pga]</text>
+</g>
+<!-- cs42l51.0&#45;004a_PGA&#45;ADC Mux Right&#45;&gt;cs42l51.0&#45;004a_Right PGA -->
+<g id="edge19" class="edge">
+<title>cs42l51.0&#45;004a_PGA&#45;ADC Mux Right&#45;&gt;cs42l51.0&#45;004a_Right PGA</title>
+<path fill="none" stroke="black" d="M643.87,-470.99C644.38,-460.3 645.05,-446.5 645.63,-434.37"/>
+<polygon fill="black" stroke="black" points="649.13,-434.42 646.12,-424.26 642.14,-434.08 649.13,-434.42"/>
+</g>
+<!-- cs42l51.0&#45;004a_Playback&#45;&gt;cs42l51.0&#45;004a_DAC Mux -->
+<g id="edge5" class="edge">
+<title>cs42l51.0&#45;004a_Playback&#45;&gt;cs42l51.0&#45;004a_DAC Mux</title>
+<path fill="none" stroke="black" d="M560,-237.83C560,-230.13 560,-220.97 560,-212.42"/>
+<polygon fill="black" stroke="black" points="563.5,-212.41 560,-202.41 556.5,-212.41 563.5,-212.41"/>
+</g>
+<!-- cs42l51.0&#45;004a_Right ADC -->
+<g id="node25" class="node">
+<title>cs42l51.0&#45;004a_Right ADC</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="697,-350 613,-350 613,-312 697,-312 697,-350"/>
+<text text-anchor="middle" x="655" y="-334.8" font-family="sans-serif" font-size="14.00">Right ADC</text>
+<text text-anchor="middle" x="655" y="-319.8" font-family="sans-serif" font-size="14.00">[adc]</text>
+</g>
+<!-- cs42l51.0&#45;004a_Right ADC&#45;&gt;cs42l51.0&#45;004a_Capture -->
+<g id="edge3" class="edge">
+<title>cs42l51.0&#45;004a_Right ADC&#45;&gt;cs42l51.0&#45;004a_Capture</title>
+<path fill="none" stroke="black" d="M655,-311.83C655,-304.13 655,-294.97 655,-286.42"/>
+<polygon fill="black" stroke="black" points="658.5,-286.41 655,-276.41 651.5,-286.41 658.5,-286.41"/>
+</g>
+<!-- cs42l51.0&#45;004a_Right DAC&#45;&gt;cs42l51.0&#45;004a_HPR -->
+<g id="edge7" class="edge">
+<title>cs42l51.0&#45;004a_Right DAC&#45;&gt;cs42l51.0&#45;004a_HPR</title>
+<path fill="none" stroke="black" d="M608,-89.83C608,-82.13 608,-72.97 608,-64.42"/>
+<polygon fill="black" stroke="black" points="611.5,-64.41 608,-54.41 604.5,-64.41 611.5,-64.41"/>
+</g>
+<!-- cs42l51.0&#45;004a_Right PGA&#45;&gt;cs42l51.0&#45;004a_Right ADC -->
+<g id="edge17" class="edge">
+<title>cs42l51.0&#45;004a_Right PGA&#45;&gt;cs42l51.0&#45;004a_Right ADC</title>
+<path fill="none" stroke="black" d="M649.02,-385.83C649.87,-378.13 650.89,-368.97 651.84,-360.42"/>
+<polygon fill="black" stroke="black" points="655.33,-360.74 652.95,-350.41 648.37,-359.97 655.33,-360.74"/>
+</g>
+<!-- hdmi&#45;audio&#45;codec.1.auto_TX -->
+<g id="node30" class="node">
+<title>hdmi&#45;audio&#45;codec.1.auto_TX</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="281.5,-509 210.5,-509 210.5,-471 281.5,-471 281.5,-509"/>
+<text text-anchor="middle" x="246" y="-493.8" font-family="sans-serif" font-size="14.00">TX</text>
+<text text-anchor="middle" x="246" y="-478.8" font-family="sans-serif" font-size="14.00">[output]</text>
+</g>
+<!-- hdmi&#45;audio&#45;codec.1.auto_I2S Playback&#45;&gt;hdmi&#45;audio&#45;codec.1.auto_TX -->
+<g id="edge22" class="edge">
+<title>hdmi&#45;audio&#45;codec.1.auto_I2S Playback&#45;&gt;hdmi&#45;audio&#45;codec.1.auto_TX</title>
+<path fill="none" stroke="black" d="M254.22,-544.83C253.05,-537.13 251.65,-527.97 250.34,-519.42"/>
+<polygon fill="black" stroke="black" points="253.78,-518.77 248.81,-509.41 246.86,-519.83 253.78,-518.77"/>
+</g>
+<!-- hdmi&#45;audio&#45;codec.1.auto_RX -->
+<g id="node29" class="node">
+<title>hdmi&#45;audio&#45;codec.1.auto_RX</title>
+<polygon fill="#f2f2f2" stroke="#4d4d4d" points="189.5,-583 118.5,-583 118.5,-545 189.5,-545 189.5,-583"/>
+<text text-anchor="middle" x="154" y="-567.8" font-family="sans-serif" font-size="14.00">RX</text>
+<text text-anchor="middle" x="154" y="-552.8" font-family="sans-serif" font-size="14.00">[output]</text>
+</g>
+<!-- hdmi&#45;audio&#45;codec.1.auto_RX&#45;&gt;hdmi&#45;audio&#45;codec.1.auto_Capture -->
+<g id="edge20" class="edge">
+<title>hdmi&#45;audio&#45;codec.1.auto_RX&#45;&gt;hdmi&#45;audio&#45;codec.1.auto_Capture</title>
+<path fill="none" stroke="black" d="M154.25,-544.83C154.36,-537.13 154.49,-527.97 154.61,-519.42"/>
+<polygon fill="black" stroke="black" points="158.1,-519.46 154.74,-509.41 151.11,-519.36 158.1,-519.46"/>
+</g>
+</g>
+</svg>
diff --git a/Documentation/sound/soc/dapm.rst b/Documentation/sound/soc/dapm.rst
index cab40a6b4c96..3a2fde1d31bf 100644
--- a/Documentation/sound/soc/dapm.rst
+++ b/Documentation/sound/soc/dapm.rst
@@ -17,9 +17,27 @@ recompiling are required for user space applications to use it. DAPM makes
 power switching decisions based upon any audio stream (capture/playback)
 activity and audio mixer settings within the device.
 
-DAPM spans the whole machine. It covers power control within the entire
-audio subsystem, this includes internal codec power blocks and machine
-level power systems.
+DAPM is based on two basic elements, called widgets and routes:
+
+ * a **widget** is every part of the audio hardware that can be enabled by
+   software when in use and disabled to save power when not in use
+ * a **route** is an interconnection between widgets that exists when sound
+   can flow from one widget to the other
+
+All DAPM power switching decisions are made automatically by consulting an
+audio routing graph. This graph is specific to each sound card and spans
+the whole sound card, so some DAPM routes connect two widgets belonging to
+different components (e.g. the LINE OUT pin of a CODEC and the input pin of
+an amplifier).
+
+The graph for the STM32MP1-DK1 sound card is shown in picture:
+
+.. kernel-figure:: dapm-graph.svg
+    :alt:   Example DAPM graph
+    :align: center
+
+DAPM power domains
+==================
 
 There are 4 power domains within DAPM:
 
@@ -48,12 +66,6 @@ Stream domain
       Enabled and disabled when stream playback/capture is started and
       stopped respectively. e.g. aplay, arecord.
 
-All DAPM power switching decisions are made automatically by consulting an audio
-routing graph of the whole machine. This graph is specific to each machine and
-consists of the interconnections between every audio component (including
-internal codec components). All audio components that affect power are called
-widgets hereafter.
-
 
 DAPM Widgets
 ============

-- 
2.34.1


