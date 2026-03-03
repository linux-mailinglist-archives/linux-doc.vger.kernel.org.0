Return-Path: <linux-doc+bounces-77723-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIFSDnYZp2m+dgAAu9opvQ
	(envelope-from <linux-doc+bounces-77723-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:25:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42D1F496C
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 463C330D57ED
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772F83537F3;
	Tue,  3 Mar 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WN158x0V"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371433537E3
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558553; cv=none; b=IClBa0FKNLyHGH4LKlSfj70ZfjPKMGdF6ddLLeg/M9PO17tdjvuY1LGET1fi3KVZ4Uxd4tnU1NCUYVY9zBVlT2zkQEGfzXO0hAAPlXaAcPIP1exuppZIZWSTALQLuW4RtTOy3jPb9InTooAeYN2GYjv20hAZdU7xUTHb+KCXyp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558553; c=relaxed/simple;
	bh=UXoGlPvqqQhWapLJaenBDd7jXix0YmytELgrhnnsdog=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TOfB4K3xN54QofzcFF92FCepaiCYm4J+d/goXOFDKMC37h4/5Cva7uDsQlyf9PoTwa7qyl6UcLUuzWSqwQcnkDvaeeNvBAYxfwGvw5MPDe5DMGnFezt3DwtzzFaHmxYfg70+Hr7duaHB66wQc2Ar5McU3njW+VF5ye2YXlFE5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WN158x0V; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6CE7A40429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772558550; bh=uRyW0yuRTkqeHs8H60Vxgek9Kw+5j47NoUAQa4DdJyw=;
	h=From:To:Subject:Date:From;
	b=WN158x0VxewawZN1iEmxD1RKYZkOFyXkIhke+cB32C1iQ58Bd2StlakjRb26d1cf5
	 X/AZ6ogzIggcOpGSoGNvLd9eT/jNuI3bp2sXyUc9+5UwS/kW72zZeDK1swap6hRnrj
	 hWrQJ9kbJWahHVfqsvD6wpYGqzyivrjX23Rna2HbMdjGy920x4wYf3F2iMJ5TdEODI
	 JWzZyq7D9wLDNGbSFxRn/CqOMTc/lQ4A/80s00w6aJ4WdBp31GprEt4FJSfmMUcdNp
	 uq9UiqtbhxoiG4ys7ftaEzAvDtinqkb9zTFEthciPB3DMS0xGf4oACgz6U73Lr/Mbn
	 El0uKukgdhJCQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6CE7A40429
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:22:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Subject: [PATCH] docs: Remove a useless top-of-file label
Date: Tue, 03 Mar 2026 10:22:29 -0700
Message-ID: <87a4wode0a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8B42D1F496C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-77723-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,lwn.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,alibaba.com:email]
X-Rspamd-Action: no action

I'm not sure how the practice of putting labels at the top of documentation
files got started, but I would like to see it end.  Toward that goal:
replace the development_process_main label in
process/development-process.rst with an SPDX line and adjust the references
to just give the file name.  The automarkup code will then create a link
automatically in the rendered docs.

(I wrote the original document, so feel confident in applying the SPDX line
to it).

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/process/development-process.rst                 | 2 +-
 Documentation/process/maintainer-handbooks.rst                | 4 ++--
 .../translations/it_IT/process/development-process.rst        | 2 +-
 .../translations/pt_BR/process/maintainer-handbooks.rst       | 2 +-
 .../translations/zh_CN/process/development-process.rst        | 2 +-
 .../translations/zh_TW/process/development-process.rst        | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/development-process.rst b/Documentation/=
process/development-process.rst
index e34d7da58b7f..4d75567cf365 100644
--- a/Documentation/process/development-process.rst
+++ b/Documentation/process/development-process.rst
@@ -1,4 +1,4 @@
-.. _development_process_main:
+.. SPDX-License-Identifier: GPL-2.0
=20
 A guide to the Kernel Development Process
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation=
/process/maintainer-handbooks.rst
index 3d72ad25fc6a..5a0e13aa88a3 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -4,8 +4,8 @@ Subsystem and maintainer tree specific development process =
notes
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The purpose of this document is to provide subsystem specific information
-which is supplementary to the general development process handbook
-:ref:`Documentation/process <development_process_main>`.
+which is supplementary to the general development process handbook found in
+Documentation/process/development-process.rst.
=20
 Contents:
=20
diff --git a/Documentation/translations/it_IT/process/development-process.r=
st b/Documentation/translations/it_IT/process/development-process.rst
index 20e77c9816a1..29a52a8a4704 100644
--- a/Documentation/translations/it_IT/process/development-process.rst
+++ b/Documentation/translations/it_IT/process/development-process.rst
@@ -1,6 +1,6 @@
 .. include:: ../disclaimer-ita.rst
=20
-:Original: :ref:`Documentation/process/development-process.rst <developmen=
t_process_main>`
+:Original: Documentation/process/development-process.rst
 :Translator: Alessia Mantegazza <amantegazza@vaga.pv.it>
=20
 .. _it_development_process_main:
diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.=
rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index eb650bc6006c..9c0f2ef52cac 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -5,4 +5,4 @@ Notas sobre o processo de desenvolvimento de subsistemas e =
mantenedores
=20
 O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es esp=
ec=C3=ADficas de
 subsistemas que s=C3=A3o suplementares ao manual geral do processo de
-desenvolvimento :ref:`Documentation/process <development_process_main>`.
+desenvolvimento Documentation/process/development-process.rst
diff --git a/Documentation/translations/zh_CN/process/development-process.r=
st b/Documentation/translations/zh_CN/process/development-process.rst
index c10d8e2e21eb..4b44370ce6e7 100644
--- a/Documentation/translations/zh_CN/process/development-process.rst
+++ b/Documentation/translations/zh_CN/process/development-process.rst
@@ -1,6 +1,6 @@
 .. include:: ../disclaimer-zh_CN.rst
=20
-:Original: :ref:`Documentation/process/development-process.rst <developmen=
t_process_main>`
+:Original: Documentation/process/development-process.rst
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
=20
 .. _cn_development_process_main:
diff --git a/Documentation/translations/zh_TW/process/development-process.r=
st b/Documentation/translations/zh_TW/process/development-process.rst
index 305d9472b017..7c7954261d3c 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -2,7 +2,7 @@
=20
 .. include:: ../disclaimer-zh_TW.rst
=20
-:Original: :ref:`Documentation/process/development-process.rst <developmen=
t_process_main>`
+:Original: Documentation/process/development-process.rst
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
              Hu Haowen <2023002089@link.tyut.edu.cn>
=20
--=20
2.53.0


