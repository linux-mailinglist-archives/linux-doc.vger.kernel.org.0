Return-Path: <linux-doc+bounces-96486-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G4ghObNDVGr9jwMAu9opvQ
	(envelope-from <linux-doc+bounces-96486-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 03:47:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3D7467CD
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 03:47:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=openatom-club.20200927.dkim.feishu.cn header.s=s1 header.b=0efXTiMH;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96486-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96486-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B993830074A1
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 01:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182512DC32E;
	Mon, 13 Jul 2026 01:47:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE80287510
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 01:47:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907227; cv=none; b=JUXjlZUPYOPdrtLnEuNSnoliqy9u4A0KK1LDoDusVJuCJRVLd5oos8Sv+ENLsAfQ+LcvmebTM+YdY/kASw9xzYejwMoDPcOmYDIAL/W6Au2dFOGeGsafGrSZi2pHARVKKqDbkht3v3qwWRO6hNFkZmnk0SAr7nv2EaOyJwGWck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907227; c=relaxed/simple;
	bh=/Ktcp+l7uLL0G7v+LT6g3m7YyM4cEFKDeTbDpmY1Onc=;
	h=References:Content-Type:In-Reply-To:To:Cc:Date:Message-Id:
	 Mime-Version:From:Subject; b=dUcN7G7feJTsihuQPEhaFVB9B//gAg5Ypwb3KDOhCjSrHnqViHb6OjBpBmfrxwDkh6gYr+OKkn44AudxJTKXY1ucT04wR5JIPVSfLO03kPlgo8CNmf/Gul0Ot+z/gP73DUsx3/8hQcDQqu7sXn7tbu7mI6XbdGGUl9iXPi423hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=0efXTiMH; arc=none smtp.client-ip=209.127.231.37
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783907216;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2q3S4x1/dODBPkXhKWUY3JUjUdqqwInmZuDQwkLD+Bo=;
 b=0efXTiMHMhk3ll2cbN0t5xnqnncbaJICn8qRjvwjyCTa6SQF1U2/Kxmz193lPkeY8+zULO
 39bF5/7DPsacsORjImr48byKYZ0h89oJY1ggqSxoP0q1+K/QzO4jPvq2bf6w5p0WHV8Ix2
 vGirfI6c1P6XqTjwzhvZPg12aEyYeT3QcfF4KnEYNJivglcAKlbDtxdWlD1bhMTOA18LTY
 sEF1ZN8ngjnZbiFxUWuyZWrFZaY20EPwHW9oftUU6dI1cs7YASQXIyA/bRY1P8any4FnJu
 QSkQ+gwDtmnZ6fzeH0/CLu3+tRZr9rXi7pE6AOVYl+TQWqpq39VdROr0cO6rnw==
References: <cover.1783905132.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <cover.1783905132.git.ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Date: Mon, 13 Jul 2026 09:46:35 +0800
Message-Id: <ea65566150d1b7797051ac2e9bb2b8725f041513.1783905132.git.ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Transfer-Encoding: quoted-printable
From: "Ben Guo" <ben.guo@openatom.club>
Subject: [PATCH v2 3/4] docs/zh_CN: Update rust/arch-support.rst translation
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Mon, 13 Jul 2026 09:46:53 +0800
X-Mailer: git-send-email 2.53.0
X-Lms-Return-Path: <lba+26a54438e+b5466e+vger.kernel.org+ben.guo@openatom.club>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[openatom-club.20200927.dkim.feishu.cn:s=s1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:corbet@lwn.net,m:gary@garyguo.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:hust-os-kernel-patches@googlegroups.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[openatom.club];
	FORGED_SENDER(0.00)[ben.guo@openatom.club,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96486-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.guo@openatom.club,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[openatom-club.20200927.dkim.feishu.cn:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openatom-club.20200927.dkim.feishu.cn:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,garyguo.net:email,openatom.club:from_mime,openatom.club:email,openatom.club:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BB3D7467CD

Update Documentation/rust/arch-support.rst translation.

Update the translation through commit 3f70ebe63858
("s390: Enable Rust support")

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Ben Guo <ben.guo@openatom.club>
---
 Documentation/translations/zh_CN/rust/arch-support.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Docum=
entation/translations/zh_CN/rust/arch-support.rst
index f5ae44588a5..0ca4be6e176 100644
--- a/Documentation/translations/zh_CN/rust/arch-support.rst
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -23,6 +23,7 @@
 ``arm64``      Maintained        =E4=BB=85=E5=B0=8F=E7=AB=AF=E5=BA=8F=E3=
=80=82
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        =E4=BB=85 ``riscv64``=EF=BC=8C=E4=B8=94=
=E4=BB=85=E9=99=90 LLVM/Clang=E3=80=82
+``s390``       Maintained        =E5=BF=85=E9=A1=BB=E7=A6=81=E7=94=A8 ``CO=
NFIG_EXPOLINE``=E3=80=82
 ``um``         Maintained        \-
 ``x86``        Maintained        =E4=BB=85 ``x86_64``=E3=80=82
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--=20
2.53.0

