Return-Path: <linux-doc+bounces-89629-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J8vKZbgFWpYdwcAu9opvQ
	(envelope-from <linux-doc+bounces-89629-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 20:04:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D835DB267
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 20:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E1F3077DF3
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C7F4218B9;
	Tue, 26 May 2026 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="SSi/aDoI"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859E41C319;
	Tue, 26 May 2026 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817814; cv=pass; b=aosoA/c42Au/r+9uFjqKXysZCykuDbPnP/ZfKrvBezgMDzJRH7xVz7SxJ44CBtYZQ3oCyuJAJXbkmjtCH03gE24codvYVKTDZ/Re9VbDhc+J/zv4DPG+k+XRXnyT7CkflDLcgNWAfMhQ17FBC4OM0+6dWsvjbNY6rIirIG02pEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817814; c=relaxed/simple;
	bh=DdD/pZ/nr15cbBsSL5kGBPgOLKWuqsf6ZPdeb/nYmEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQcQIu6VVgnJbJRd1MzTej9xuOSRJ99Zdkh+ztrb/KpWgCzRPq9oaFwoC2qWCuIYo5UVF1JypjHvhNQBUaUj9Y5veR5ROwq4/Faras+MZjGMDrPL2dJEbaU8+cHhIOV8IVzGebyA4zhMe3rPWYJqJ1H/WKfgiBM6vbPTo+37fXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=SSi/aDoI; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1779817799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cNQxDWIZMtjlShI/i3gdjnDxmAms46tzN6UedsgP7+onQKjBBc5qgQUqeWkoFA4eqI1AIILw3JrBJRcdawlqWgxILAkqjRsrgPrCiK0Zr9xPuatUQunLB+vEnIymfjjC1rSNHAxxr7GxSCnCkrpxLSo3KuWTCNJHQI6KrWNw/DU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779817799; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GHspFBKSVp6v+wlp5GmuX41RZNfc8goqrKH0LS7xmwo=; 
	b=fXIkPlJIhUXQoSKNQrh5pmzYC8RVtaWB57HQJDQQ457ehE4TUHABFJacYcquP7co763vf84Owxe7I5V+9ZuFRUnRk1APIY0V08WHrSmqzQ9UeVOKBzLN8usbcAZKbyE3mVD9993huVPmVEcWMv0Uv8+q9BmAZz79Cpah2OAzTGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779817799;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GHspFBKSVp6v+wlp5GmuX41RZNfc8goqrKH0LS7xmwo=;
	b=SSi/aDoIVuGIJWuFhNd+XF/24vscn89CO6+tyHUW1v9uxSniUeqwaWGTLLT2dGXt
	lKUIxUxtXWm0IzLmNZrtcFpgdDljoB0dp6A9eq7t/Ekh65zrTKfXsPpEpsi6IgIzV2E
	kyCvpebv/xvSmnpDG2l1OSq8znTQ2X0SF1Sc1XxJU805foDoQFKBl5YT8iTXJBRvsfw
	2oofj6YuGXf8sg6ISHaFMyp6iku9Ag4qBSTb1IwvQrSXBOiJgKrQSXwXCf5zUzju4rh
	oXMfmbEFlk7FEt3/ECFCL8M4xFm8hDOqAFlbOcXyfJImOvSzrZHh9wI43TPiH9U4y1B
	zjLBPUXMng==
Received: by mx.zohomail.com with SMTPS id 1779817797328909.2614707255308;
	Tue, 26 May 2026 10:49:57 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 27 May 2026 01:49:23 +0800
Subject: [PATCH 1/3] ALSA: doc: usb-audio: Add doc for
 QUIRK_FLAG_IFB_SILENCE_ON_EMPTY
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-uac-quirk-get-cur-vol-v1-1-e9362b712e5e@rong.moe>
References: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
In-Reply-To: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,rong.moe];
	TAGGED_FROM(0.00)[bounces-89629-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rong.moe:email,rong.moe:mid,rong.moe:dkim]
X-Rspamd-Queue-Id: E3D835DB267
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QUIRK_FLAG_IFB_SILENCE_ON_EMPTY was introduced into usb-audio before
without appropriate documentation, so add it.

Fixes: a23812004228 ("ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index f75f08763941..4b30cd63c5a5 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2383,6 +2383,12 @@ quirk_flags
           ``V(x) = k * x``; ``dB(x) = 20 * log10(x)``. Overrides bit 24
         * bit 28: ``mixer_capture_linear_vol``
           Similar to bit 27 but for capture streams. Overrides bit 25
+        * bit 29: ``ifb_silence_on_empty``
+          In implicit feedback mode, when an entire capture URB returns with
+          all iso_frame_desc[i].status != 0 (bytes==0), do not silently return
+          from snd_usb_handle_sync_urb. Instead fall through and enqueue a
+          packet_info containing only size-0 packets, so the OUT ring keeps
+          moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
 
 This module supports multiple devices, autoprobe and hotplugging.
 

-- 
2.53.0


