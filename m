Return-Path: <linux-doc+bounces-92990-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8THqKl71Nmo7HAcAu9opvQ
	(envelope-from <linux-doc+bounces-92990-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 22:17:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE666A9ADB
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 22:17:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rcpassos.me header.s=purelymail1 header.b=jfEFWZQv;
	dkim=pass header.d=purelymail.com header.s=purelymail1 header.b=mnOrpxrE;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92990-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92990-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=rcpassos.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAEF43013AA9
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 20:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAEC233936;
	Sat, 20 Jun 2026 20:17:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76E01BBBFC
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 20:17:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781986651; cv=none; b=vGkDVyEAIdtFiwp+XEv1wkq+xHhjSUaXEd8Er8uOqu76u9jEp/rF+7KJgyF+4T2PC2bZAYcs9Klab1AvBLyTc4jWAz0iYZ5sQYUjdz3AZGyOg90LAA0r8T9u1+vJd4RuAAvTLA/4gx7MYOKRBxL0e4M0Z4mQaGoB64X43eWWR0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781986651; c=relaxed/simple;
	bh=8NVB9NyCVjiLoOknnIeK8NxqSo+nXp/pzPs+bTgotVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dhEvn0sN35W+/pS4cUJX46Ka/ueez0fhquCGLbUla+6/0CZgOt6ZGPJcAa5NiSrHcjkSofyr7U12dzwBFQGZD26A+hESs6Qat1WDxNzq03Fzd4LslfUaVWSrVyVnCKJwrAHhAYMXBN9p/0ko8dX+3mxKfgWCgTPEaIuIwBKOR6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=jfEFWZQv; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=mnOrpxrE; arc=none smtp.client-ip=34.202.193.197
DKIM-Signature: a=rsa-sha256; b=jfEFWZQvcUG4Dw69285ditVbDUKO+pizizZKbshcxoQZ8iYl5tIZHmf5a4HSkYMfydB9U2XUwRVuZqLiDzloTRyuBvQgi7JzfrbJKD/PpplFGfACZWhysqka7YEcMHuljTOQN9cBT6kFi3EpnUYcD7KWhGNtHZ1DfNUFSPlyxQ42Do6mULeeu08FZa2iePEfQspRQzvM8j6VNa2/pAnmR2E1qL1RAbunOUaef4gY3dYtKMcbYrjEBHmnUdqnmcxjSsDybC6uf9/YjvgprZFxmkaUPrfnPtUzkBH2JtdPvyhK1AoqulWTZVxHRUePS7RoEeb9IuykkF2M5XGgPeMI4w==; s=purelymail1; d=rcpassos.me; v=1; bh=8NVB9NyCVjiLoOknnIeK8NxqSo+nXp/pzPs+bTgotVw=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=mnOrpxrE48XUGZ443dMjMdtIRETEz57kiGr7u08xEC0HtsdDp19XSJ8rndiZ3Eau2avFJGSpYv8KSU8N2hhSl3LjipENQQYJyPMEc/uDXziqeq01rEHVILr7V4Gfoui2WxzpSIURx0ttB3j3kIYW0su8z3Zi4J1V1qyjBfUoqYH2FC/Au/ZefDJWEmAUaAfw462WTqO7RyIo/2+laV875NDrZhQjeKswEF2DMkEn9iasuvE/Yp3VmEp2UliwxInfnratuwCE2TPpHmaCMFVgr+FX8XxNWhHGnmQTam1EOXVGa11aWHQQC/73krjxVyvtuLhn+KhsHWG29RRrEJvLbA==; s=purelymail1; d=purelymail.com; v=1; bh=8NVB9NyCVjiLoOknnIeK8NxqSo+nXp/pzPs+bTgotVw=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1982731664;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Jun 2026 20:17:28 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: [PATCH 0/3] Documentation: fix doc build errors for 7.2
Date: Sat, 20 Jun 2026 17:16:32 -0300
Message-ID: <20260620201732.94141-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92990-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,rcpassos.me:dkim,rcpassos.me:mid,rcpassos.me:from_mime,purelymail.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECE666A9ADB

I noticed these 3 errors when building htmldocs from the mainline
by the end of this merge window.
All are just formatting errors, fixed using the rules from the
"Writing documentation" section in docs.

Thanks,

Rafael Passos (3):
  Documentation: iio: fix Malformed table for ltc4283
  Documentation: xe_drm: fix chars used for subsection
  Documentation: ABI: fix description field indentation

 .../ABI/testing/sysfs-class-reboot-mode-reboot_modes        | 2 +-
 Documentation/hwmon/ltc4283.rst                             | 4 ++--
 include/uapi/drm/xe_drm.h                                   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

--=20
2.53.0


