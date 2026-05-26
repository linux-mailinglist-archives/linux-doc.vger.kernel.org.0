Return-Path: <linux-doc+bounces-89631-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFNfG6LdFWrTdQcAu9opvQ
	(envelope-from <linux-doc+bounces-89631-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 19:51:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD15DAF36
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 19:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66779304FFC3
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D615C421A18;
	Tue, 26 May 2026 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Q3XiUAMt"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4ED4218A1;
	Tue, 26 May 2026 17:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817814; cv=pass; b=qGeT29iRsFth5wU92vGN8aH+iPZHVaBwTT1tbdPdir3mbcEZHTs/P9sMRycepm6dHVC4HwP7sL5954KyIzVAxjm9r5Twfy/iPclbYvJNWkWKvzX7T/eHvULgCzZEHLjMxM8Rkzs5mGd2am+9Dr6A1OsRPvhZx3YyNmjQ7TnUN2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817814; c=relaxed/simple;
	bh=dX/xlJm99PctX3tKLrtgErPzWLirXtTDlO4/3TixXrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lbA9FvxXu0Qoo2+2LA96aCXvhau0BwY+FyPo+XxEnX/kkk4hXjFl8catgXqU4QZE8xFb1nrqkxFE3XCtk8FI7XMT+ghtPrWZpPvnk9G8dAAa6QgTcn8B9+FVy+AXGyj8xdfbk2bTC3lpT0oWkLS8WvjoRISI0iZwPvZpkgtVjso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Q3XiUAMt; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1779817795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hnCN4E8z7/rcDswr4R0fgVmlg2HpgGYkWCJKJK2wbDyp+UdvV+f6rCJ4m/Vs6F84sCNrkjk3g8fXJpAilW9zAEjMcOfHwJRLmAFUJx9UXkMsw8/wmWKdno/xN53Tt+O7lrlq04CR9DtSObyFESqfkNwrc5yBcdz+cCixg2SWp1c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779817795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ssrG3TggKkTmtkgvrC9+Jc8mBvxiFgZczsaJ3+ndGDo=; 
	b=DmhpvgnHHpDnXLyGXAWvjX4X24cVvaaLZTyT0vD4TFYRiriQqo0f8GMZgtTQ5Dn0aBwDC4/Dl3YfeeYfWlKFCP4MUXVdPRmVBlx6Yk6jJOf8Xv7C0HUfI2bGfE8o7TAmYmEva2fZbVAo/QERDXq/rFKBgSPj9FGRdzkpBzCa1oI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779817795;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=ssrG3TggKkTmtkgvrC9+Jc8mBvxiFgZczsaJ3+ndGDo=;
	b=Q3XiUAMtXAwUlOM1fxdHoWksZ0MM91cVfZgD3VLe1b/sfNfTvXDzLt/Q3/YImBgu
	aZRCiSpwSahmSLcUOP3hmOBavK/2BRb3nRaxBsA8wq6/Q+QDD5WimDlvhRupIyTk69o
	C/JMsEPAHBpqJMDzKI2CDdE3eJbRmtII1ArHwgYm5nUW//1Cm8P9PXPufgplKmUVP1s
	0+xEIVTQ8wHFm2ctYz5syC4biJeTXDkrRVMO0aMv5B/DmyBB7IBNEXEAeRQVeMvO5W/
	M4S28YWFad8LsYbjboMD0tlKqQJkqGp3+rAnMa4q9XFutWnUVPbOs+YQKJEUmKnPJFq
	VbqVpsNhew==
Received: by mx.zohomail.com with SMTPS id 1779817794286453.7977302102662;
	Tue, 26 May 2026 10:49:54 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/3] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL
 for Sennheiser MOMENTUM 3
Date: Wed, 27 May 2026 01:49:22 +0800
Message-Id: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLdFWoC/yXMQQqDQAxA0atI1gamkSr2KsWFxqhR0TbjSEG8e
 6d1+Rb/H+DFVDw8kgNMdvW6LhG3NAEe6qUX1DYayFHu7lRgqBnfQW3CXjbkYLivM7auoZI4k6L
 MIbYvk04//++zuuxDMwpvvxmc5xdnEcfKeQAAAA==
X-Change-ID: 20260527-uac-quirk-get-cur-vol-d0b292c3e796
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Gordon Chen <chengordon326@gmail.com>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,rong.moe];
	TAGGED_FROM(0.00)[bounces-89631-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rong.moe:email,rong.moe:mid,rong.moe:dkim]
X-Rspamd-Queue-Id: EEAD15DAF36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
identify devices with sticky mixers. Unfortunately, even though most
devices with sticky GET_CUR also have corresponding sticky SET_CUR,
which I actually met more since the commit had been merged, there is
also a rare case that some devices may have volume mixers that responds
to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
check to consider the mixer to be sticky and unnecessarily disable it.

Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL to prevent sending GET_CUR to
mixers by returning -ENXIO early. The error effectively skips the sticky
check as it's only meaningful when the mixer has some sort of self-
awareness. Similar to QUIRK_FLAG_GET_SAMPLE_RATE, this should also help
if some unmet devices can't tolerate volume GET_CUR in other ways.

The Sennheiser MOMENTUM 3 needs the quirk flag. Though its UAC mixer
works fine and precisely corresponds to the reported dB range, the
mixer's volume GET_CUR method is somehow stubbed and returns a constant
value (15dB), resulting in it being disabled by the sticky check.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (3):
      ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_IFB_SILENCE_ON_EMPTY
      ALSA: usb-audio: Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL
      ALSA: usb-audio: Add quirk flag for Sennheiser MOMENTUM 3

 Documentation/sound/alsa-configuration.rst | 10 ++++++++++
 sound/usb/mixer.c                          |  5 +++++
 sound/usb/quirks.c                         |  3 +++
 sound/usb/usbaudio.h                       |  6 ++++++
 4 files changed, 24 insertions(+)
---
base-commit: a23812004228d4b041a858b927db787a7ff80f50
change-id: 20260527-uac-quirk-get-cur-vol-d0b292c3e796

Thanks,
Rong


