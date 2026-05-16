Return-Path: <linux-doc+bounces-87878-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBZpBXmqCGrP0AMAu9opvQ
	(envelope-from <linux-doc+bounces-87878-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:33:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F655CF0F
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB05430125E6
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 17:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA93D3EEAC2;
	Sat, 16 May 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKgsq+O9"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622B3EE1FD;
	Sat, 16 May 2026 17:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778952821; cv=none; b=ZSYLG/z5dZu8UdBXlzoCY2zUJ4t5fAUrVVmlKphM/ququLliDG26xh38c9RSbamfQwizRJ9Vcj5UhZqfsigkM2kTds979DKPeNfCryzFQY4sHXm9YR8Gq8XhhJrM0SBGLR3qJ191U+iEKvzkRPxcmCq8B5XyoKmdRZ7ukThK0gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778952821; c=relaxed/simple;
	bh=c1YMSoN++zepxFOigqc0PlaQrH3QwUeyIj2/zhRN3CA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNqEyKceQHg4c9IaaMNE5RjdTFd9349KxqqL4kqjMtc4ud10KUbZqd1yKptCRh4XH5f59YXndEk1rWcFvOtEkDxVZgKnVFYKpY3HZT84USLceKnzueMVaZrBgCG7hLXVHBuNXLCWsUE2P41q++2YDGMxhGQwnUunuVtvN7Cakm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKgsq+O9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D182C19425;
	Sat, 16 May 2026 17:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778952820;
	bh=c1YMSoN++zepxFOigqc0PlaQrH3QwUeyIj2/zhRN3CA=;
	h=From:To:Cc:Subject:Date:From;
	b=dKgsq+O9OwmsaXLZjzrC2pa+vVHNxbWxkoSydYgljuFmcyRWLlOc3MnT0T7CWyZyF
	 /Gm5fb0P7Ym/KN2lg5iXVYCDKa7wiYhsU18ND+bT9JOrB2zj1UkZ/jnA1A5RIje87R
	 t6QjRKP45JULwiFxXruJ+lL/f/JeytNwKhZFjHd0/YyPgyryw4V0snqHKNhZwsU4hq
	 tKTf9q7QkQhsGWMs9KDmk6jl5dY5VICuTbvB2XghnbwXTrlpm63MBcOWQ0oTXFxxQq
	 q0BUe52KAxgSkatoamBz/o+HjGyMS2EvVT2dZoUEXXUCxpUYoEOpD2sdMNq/bf75zl
	 uMCQVaZXkS/zA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wOItO-00000003IgA-23ww;
	Sat, 16 May 2026 19:33:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/2] Two small cleanups to maintainers_include
Date: Sat, 16 May 2026 19:33:32 +0200
Message-ID: <cover.1778952682.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: AD4F655CF0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87878-lists,linux-doc=lfdr.de,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

Hi Jon,

This series contain two minor cleanups to maintainers_include.py:

- make it backward compatible with Python < 3.10
  (according with vermin, it should now be backward-compat up
   to 3.6)

- keep "THE REST" at the end.

Mauro Carvalho Chehab (2):
  docs: maintainers_include: restore compatibility with Python 3.6
  docs: maintainers_include: keep the last entry at the end

 Documentation/sphinx/maintainers_include.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.54.0


