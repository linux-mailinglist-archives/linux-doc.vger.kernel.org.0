Return-Path: <linux-doc+bounces-92993-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4Rk4MGH1Nmo+HAcAu9opvQ
	(envelope-from <linux-doc+bounces-92993-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 22:17:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749F26A9AE7
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 22:17:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rcpassos.me header.s=purelymail1 header.b=LUb9VfXM;
	dkim=pass header.d=purelymail.com header.s=purelymail1 header.b=EjsWwYhp;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92993-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92993-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=rcpassos.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CBEB300DD63
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 20:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76681BBBFC;
	Sat, 20 Jun 2026 20:17:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C2622D7B9
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 20:17:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781986654; cv=none; b=jUBFM9WeTklJUoReDFix80oHsK29bTLi4caUSQadgbsa/onJ9lb3tp3Ijl7LNXFPkcJALSUpHeuP2Fk+CO2Taf7iNrsgHBhiNUbGLlIEedeHQnqXYLjycQ9ZOQ6o/V6NzKCrCJ92illtY+USnc4FmILEdWgqQXWv1pA1I+DMI+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781986654; c=relaxed/simple;
	bh=RaosSzfSxBRptlmLmw+xGjKOH7g8SXxx6cNGqrB8zXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEKxN2WpFMcBOVWTvIzs/dBrgJZRALLbPgT4hRhOlmBXCxLfz+TStoeJWwR0TyDJYuo2BrsI0UCReEjiC9pYu83RCTRT69QQuS/XYYOHiZe9YPVhTCd+XlBoKzg33l8Z6Ui1QlTWA1Adwl1Pt8wxKrcCIq24gLicabvgYcJkvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=LUb9VfXM; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=EjsWwYhp; arc=none smtp.client-ip=34.202.193.197
DKIM-Signature: a=rsa-sha256; b=LUb9VfXMvDclnQ1bAmBPSHB0myXQqew0M2ofH7xxENwihEFujTfaXCLScLn/kAlhlL63JS84kv/RF7kF4cOxB/VtzCU+vvHciejw3VyjZvVK3jiMnoTwK1RIg2NzC0nkSbXq0DoXI9ZeI8GBfTfm2mbvMkGPBF9JXi0+Hpl3JshA3PLq08MhryJ+MSkFz3+E+cO21KbDVrueAZCMl8/cjetqOzo++BJsuS6SIXoXl8NtGN/BtOrMA0yIt3E9m7/2zHT9e/gVKN7y//fNeQ1im4vdMa22/1lvK2j1VB4RkXsGTGsOgtBHPC9KhbqDf8cG4ztn0Xfyp40IM/6occajkA==; s=purelymail1; d=rcpassos.me; v=1; bh=RaosSzfSxBRptlmLmw+xGjKOH7g8SXxx6cNGqrB8zXg=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=EjsWwYhpgFCy+6BQrcrWiT2mWMPei83YIel+RQAyginPePJjZhms2EzaB2mPr3idvRnxIRtiDxeuFpt2l6XmfxDChpQFyp4x6mtVnSkMKHaeQA5bjvyPMu/1ApFEuWfatMio5fzDTCGAa2gLnT+J9eyFxQhJ0t9rBGxt1lqlk5U8Uzov8RyFzGADELuhwP8+eigaWXzfV8U0cMDEqVynjqOBniyeIIGnzlcttPRFatID6qnIGVayJDaO0LhnihnEOXrfPo/Hv/k1X1j5lgxaJXrjeXFvce1mQfk2nQgKdRkFBJt5CUd/GQomNkv3b7OC8iT2uB+hPRvoN04pXl5CZw==; s=purelymail1; d=purelymail.com; v=1; bh=RaosSzfSxBRptlmLmw+xGjKOH7g8SXxx6cNGqrB8zXg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1982731664;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Jun 2026 20:17:31 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: [PATCH 3/3] Documentation: ABI: fix description field indentation
Date: Sat, 20 Jun 2026 17:16:35 -0300
Message-ID: <20260620201732.94141-4-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620201732.94141-1-rafael@rcpassos.me>
References: <20260620201732.94141-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rcpassos.me,reject];
	R_DKIM_ALLOW(-0.20)[rcpassos.me:s=purelymail1,purelymail.com:s=purelymail1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92993-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[rcpassos.me:+,purelymail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,purelymail.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rcpassos.me:dkim,rcpassos.me:email,rcpassos.me:mid,rcpassos.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 749F26A9AE7

The "description" field was missaligned.
doc build identifies this as "missing description"

Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---
 Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes=
 b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
index a16c54ab841b..a757a3fe8dd9 100644
--- a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -2,7 +2,7 @@ What:=09=09/sys/class/reboot-mode/<driver>/reboot_modes
 Date:=09=09March 2026(TBD)
 KernelVersion:=09TBD
 Contact:=09linux-pm@vger.kernel.org
-=09=09Description:
+Description:
 =09=09This interface exposes the reboot-mode arguments
 =09=09registered with the reboot-mode framework. It is
 =09=09a read-only interface and provides a space
--=20
2.53.0


