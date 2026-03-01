Return-Path: <linux-doc+bounces-77485-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Pt4JrmxpGl1pQUAu9opvQ
	(envelope-from <linux-doc+bounces-77485-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 22:38:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 193161D1A3E
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 22:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D266B300FB79
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2026 21:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C19F275114;
	Sun,  1 Mar 2026 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ArknmnUm"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CB30B51E;
	Sun,  1 Mar 2026 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401077; cv=pass; b=MAxfRjL5fpzsq6StWXngFkmywyunw19gOaarCEKgkLtRGXGTjb8SgAefG2u4LGtwEIIYOmuD+AsGk7mf4/9eNUX1iatiIJwPYvxNj0Tz4V6uIMpJJNOFN9Tva2rvWOpKCbjL/EtL4ohsguAwmjiz/Ddub59BTx2dOc4qsPkHimI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401077; c=relaxed/simple;
	bh=NM9WorNUTYDvCgYuvOhOMqaKRtpEaQHw3gE18Ca9y7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QTtiIPfS7LdtpD2DbtrARnQ/KXcBCzChITgDXGW0knO+NcU0kmQqPg5FUSti2D7C2PK+YiSXDRsx4iFxBAI80GusAM4v3XwfBTp08FOEyHGSkh9QiXcgbAZiY70MbmCYb/23mXvRFtl4gDpL1W8hp4BIcSLTfGqrRqeB4tnGPf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ArknmnUm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772401054; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AiHFJU/EEtfKo3kaCZGflgaiCW6Y7PMuP4Iflj5uxXPkos7WY1B3uHjLYeWIaeV2ZnCyiAVGNpl9WFweNLq59P/iOe+7S9gJ0evnM/fZ4hc/boZXUbqvwzOgl27/lKnjnehmBJOCrIdEG7bAl13xYqcDtR+nyrQD7S8phMgtCwo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YpXMZafJrVbcV4K0q7QwGW+t1sRBWv49tZIj9kK7sRE=; 
	b=ni65CoLSPMx5t53krg6E16Fe72C+8Ok3/vnjpDObWxS3Pu0NYi55kCkwfmQvbhm6AqVkZ8TCt5XWJ1kaFDi6gbhStNd7Wff0lauFby2mMg0QY32zSbLvaSLmsADLiZUPb5CIqZf6/uprIn045t/84/MKexYdAeGrJSOE9upUBkg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401054;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YpXMZafJrVbcV4K0q7QwGW+t1sRBWv49tZIj9kK7sRE=;
	b=ArknmnUmoNm2C2w0H+sSucaxMkThaULNIDk6dVpbowaCsFfuO+lanZvaeJyu4WQk
	NhettPPI9BUBgwBTlf7IwTl8IgNbhZxS21FaW1Jf1aA6O4AOScJClkQazN0GFUVSYh5
	gebgkSpRZOtVDf7T78v1Jx7wwh9zkFqBwjAzLyXSEcb9burxdJiPl/VqXK9WZd4UTwp
	r6/fmUAotCPvTY56+31Jipy2QkrXCh5qJ6UMPd8YvG4w6LA2Msp1NHuw7eLKqaLOgsR
	hQ5C0nFFbABrfrrrr8eEH7moaz7Y+k7rvbkiwygXQpeOoZwPIppVi2bfD1ZpQ0c9jCd
	H4BiWKOspQ==
Received: by mx.zohomail.com with SMTPS id 1772401053004351.32865877097856;
	Sun, 1 Mar 2026 13:37:33 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/9] ALSA: usb-audio: Add quirks for linear volume devices and deconflict VID
Date: Mon,  2 Mar 2026 05:37:16 +0800
Message-ID: <20260301213726.428505-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77485-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim]
X-Rspamd-Queue-Id: 193161D1A3E
X-Rspamd-Action: no action

Some quirky devices tune their volume by linearly tuning the voltage
level (linear volume). In other words, such devices has a linear TLV
mapping of DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0).

The series mainly adds quirk flags MIXER_PLAYBACK_LINEAR_VOL and
MIXER_CAPTURE_LINEAR_VOL to represent this case respectively for
playback and capture mixers. Afterward, apply these quirk flags on them.

Some MV-SILICON devices with these quirks also have another quirk: VID
conflicts with Focusrite Novation (0x1235). Hence, add support for
string-descriptor-based quirk table entries and define an entry for MV-
SILICON to deconflict them.

Some improvements to the logic of volume range checks is also included
in the series to help identify quirky devices with linear volume.

Rong Zhang (9):
  Revert "ALSA: usb: Increase volume range that triggers a warning"
  ALSA: usb-audio: Add helper function for volume range checks
  ALSA: usb-audio: Improve volume range checks
  ALSA: usb-audio: Support string-descriptor-based quirk table entry
  ALSA: usb-audio: Deconflict VID between Focusrite Novation &
    MV-SILICON
  ALSA: doc: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP of snd-usb-audio
  ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
  ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
  ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices

 Documentation/sound/alsa-configuration.rst | 11 +++
 sound/usb/mixer.c                          | 84 ++++++++++++++++----
 sound/usb/mixer_quirks.c                   | 56 ++++++++++++++
 sound/usb/quirks.c                         | 89 ++++++++++++++++++++++
 sound/usb/usbaudio.h                       | 12 +++
 5 files changed, 237 insertions(+), 15 deletions(-)


base-commit: 39c633261414f12cb533a8b802ee57e2d2e3c482
-- 
2.51.0


