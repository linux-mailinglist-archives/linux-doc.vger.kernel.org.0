Return-Path: <linux-doc+bounces-92131-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z1UGKPQsLGqAMwQAu9opvQ
	(envelope-from <linux-doc+bounces-92131-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 17:59:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C90867AAA5
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 17:59:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=mKY0APvw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92131-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-92131-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33619300D1D7
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 15:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E07349CE9;
	Fri, 12 Jun 2026 15:59:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C833D4EE;
	Fri, 12 Jun 2026 15:59:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279984; cv=none; b=SWyxULIn0a8CQFf9wZPm/iXegkhiZbtwG35H22+AMnq48N9zaApOBvDr89hRKPLjOVGuImJLx7r11CnoU8tKRroCoDM/evGmHB9pEvxgG1w/Ru6+XcgNLDhZLublCSaldOxGHGp4Qv3i2hvUW45NDWxVlegOVWbAcgRAu8f1b6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279984; c=relaxed/simple;
	bh=8fd54BbzUf1140gNwkaPK+5v0L3fIU88JElzw/g48Mk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=L+ozVRy/LxQ8Sj4W1yf28B7GIZH+z7iIK0hmZjIPb1jU0A/g0nkwzreoKMWt5wseshVz0Zgb9w2WGTm7KYX70otACpzqSlqave5fFZWi133VbEBqZuMpZMDPYAxIHzqDbgv4BbceekvfjlqBMhsDPDc+iyl2EO4EnKFwNMF7Kao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mKY0APvw; arc=none smtp.client-ip=162.62.58.216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781279972; bh=ai8EBrIICvkd1TZSYYlXYZrQb4Tl1iyP+eNEDVZe44Y=;
	h=From:To:Cc:Subject:Date;
	b=mKY0APvwOakM1feAX7LGGFU9l4XaBBd7FB2nvZPeh32TaHlOVusWZ7JFmatwoROpR
	 0ax8Sxv5Oq0he5Wc2QDWWsUJeUqby8t8Emls9aZKAhSPLbSEWlgDJZRYAQUUKLQX4R
	 TbP5hinBx/Jipohv/Ow9xx946KR4ZJK0+euXdKS4=
Received: from 172-1-1-128.lightspeed.hstntx.sbcglobal.net.localdomain ([27.38.179.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id EDDB30C4; Fri, 12 Jun 2026 23:59:29 +0800
X-QQ-mid: xmsmtpt1781279969ta6ifr0a2
Message-ID: <tencent_001080DF135CEE2CD1B260EFA08E3CC71A09@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJTnArvpH5PN3wElsjW4SMQFv99zuzjsvasCRUcyKqVGX+43H9WG
	 WmOJkzDxI6JPBgAlPUR5+AoDRYGbmb6Ay7+zg7OQaWPQWMwvTEh85MrSKto1gKjYlQNhuRDhs7sb
	 6yd290sqAWzkDSlmpqQxFDM3oFQy8WyF/8diucuNkvYOJZeYiQXGOkQGBvBL5HxzrBl4QygYk6rC
	 smv1bsJBni75erXUivFJEIHEmynlm1BlfSg3wvRb2Cx2fMsPadVudCpVskR9fgaLdu6O1LB24LL9
	 SAWpkZgNmI3IdLKSYAXOS9VJaTlVbgTztOiSyuTwJrsSWdhurI/O9e4OiwlOP8u/yiTECagp8vFd
	 Dl8ZNZ15yo/Xhf2hRYwDU7JqJ7zHSavGq20ZrSwJOfDIu8fcwLwaJ4XwO2Q8AfoSN+l7+rCz585K
	 y7RCOTuL9v0PDStcXsYSH3Mn28DGoDQv4ugwZhED5RvgW9wBhi0+eqS1rKyLj5CS29zy1uCGIR5+
	 hGAISixFxwhfJhy4SOyIKYWdubmSl2pFjn4NnIFPEFQHL3ISCPE8kG7nHt7X4yKAJHlSQbsyUvIR
	 u/CmVJMUG2qrjKwhvPkURcgpZQe2Z44Z/Gucyca1S6NEj30bxmC9VpXAvTHCiY4Pb7bcNjLPvN2S
	 +2e/Lbfx7zU//cxQH8gLd/mAmtT/rgObe0DCzeyvolNFeo3K1ZuXuKro2OxxWTfdjo68CqxqLmJG
	 FCtlT+Y1UNNA5cOtmNKPWblJPoWACqPT5LJE+u1uRc6Tj2TTDjDiHL4yCPa/SApzGNu/HFLjQvjF
	 VtOM9J1ub+h6vCb0B3xlZ8VmYFnDBYtfyuYf1H/snHI6XDbdQ5GyrOmszjAdT+JypI4J0DJp2Tii
	 C/gcdcnTJtzaiQSiH/jCEVziElr3Xepcg8NFSqSSdusHvIrbAb1JAyVxxe8G7OVNMVSJ/FBSGx5d
	 vpTvlL+qLkLyveVYEREjq77epqva0zjbyviwjqGNj0AsTKOpXL/4dpUwXNAq2jYKD5q1WIY7T/xZ
	 BhryVHECwwQECnxG+vkP6lz9q+f7sebHshzn8M4GEHYMUA/qHJ6K5zxvDbFIvkd+p+3hb2BUc6u+
	 7nd3LhQJp2iD7kVmrsy2Aercvf5g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yan Zhu <zhuyan2015@qq.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	mic@digikod.net
Cc: dzm91@hust.edu.cn,
	skhan@linuxfoundation.org,
	gnoack@google.com,
	zhuyan2015@qq.com,
	linux-doc@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
Date: Fri, 12 Jun 2026 23:58:19 +0800
X-OQ-MSGID: <cover.1781105672.git.zhuyan2015@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92131-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[hust.edu.cn,linuxfoundation.org,google.com,qq.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[zhuyan2015@qq.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,m:mic@digikod.net,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:gnoack@google.com,m:zhuyan2015@qq.com,m:linux-doc@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhuyan2015@qq.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[qq.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C90867AAA5

This patch series adds the Chinese translation for the Linux Security Module
(LSM) admin-guide documentation, including the main index and all ten
sub-pages: apparmor, LoadPin, SELinux, Smack, tomoyo, Yama, SafeSetID,
ipe, and landlock.  The admin-guide toctree is also updated to list the
newly translated LSM/index.

The original English documentation was restructured into reStructuredText
by Kees Cook in commit 504f231cda56 ("doc: ReSTify and split LSM.txt"),
and each sub-page has been kept up-to-date with subsequent mainline changes.


base: https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next



Yan Zhu (10):
  docs/zh_CN: add LSM/index Chinese translation
  docs/zh_CN: add LSM/apparmor Chinese translation
  docs/zh_CN: add LSM/LoadPin Chinese translation
  docs/zh_CN: add LSM/SELinux Chinese translation
  docs/zh_CN: add LSM/Smack Chinese translation
  docs/zh_CN: add LSM/tomoyo Chinese translation
  docs/zh_CN: add LSM/Yama Chinese translation
  docs/zh_CN: add LSM/SafeSetID Chinese translation
  docs/zh_CN: add LSM/ipe Chinese translation
  docs/zh_CN: add LSM/landlock Chinese translation

 .../zh_CN/admin-guide/LSM/LoadPin.rst         |  33 +
 .../zh_CN/admin-guide/LSM/SELinux.rst         |  45 ++
 .../zh_CN/admin-guide/LSM/SafeSetID.rst       |  82 ++
 .../zh_CN/admin-guide/LSM/Smack.rst           | 722 +++++++++++++++++
 .../zh_CN/admin-guide/LSM/Yama.rst            |  71 ++
 .../zh_CN/admin-guide/LSM/apparmor.rst        |  59 ++
 .../zh_CN/admin-guide/LSM/index.rst           |  46 ++
 .../zh_CN/admin-guide/LSM/ipe.rst             | 723 ++++++++++++++++++
 .../zh_CN/admin-guide/LSM/landlock.rst        | 169 ++++
 .../zh_CN/admin-guide/LSM/tomoyo.rst          |  63 ++
 .../translations/zh_CN/admin-guide/index.rst  |   3 +-
 11 files changed, 2015 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/LoadPin.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/SELinux.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/SafeSetID.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/Smack.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/Yama.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/apparmor.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/ipe.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/landlock.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/LSM/tomoyo.rst

-- 
2.43.0


