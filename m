Return-Path: <linux-doc+bounces-31160-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B69D2F85
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 21:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9962B26CD3
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 20:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79D11D3560;
	Tue, 19 Nov 2024 20:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kNMCI6T+"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4543155C82;
	Tue, 19 Nov 2024 20:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732048325; cv=none; b=ob5kYdq9tuRPyht1KdzBUcIK6YnKhLIbh5ctxJphzACyKfkCuqNuiz/d8WQeK4ODf4HEPDX2TKNWwEWNEqAHLIBy49t0n4Svbu45XNlHJrbrLmzYtJhRpwyBXcq3wxWHkLkoeFRmlUA/iBwL//daMCdARW2GdH3Mj38zMBpKXko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732048325; c=relaxed/simple;
	bh=vrFsxurVq/BJ/xvcvlT3/wbuDKHLr2tXUvnmDDAmtjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BdspDgTm0aGb7jvBCCq6HAqxLHU0BUVTK5VYW5PNGEebkYGMWckMAROOYJgqY+C+0lG0CrWTrc1xvNLiQdNNlETqSkinszzS462vBLst0JgjoAPALjfSdH4MEy02r0Q29llKkXHhlpw1BbsVLDkQPbzNcztl+iNkv6zzRAhyUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kNMCI6T+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=raYHq4xSb4I1iWLX1Wub6G7Uhljy2PVXhbBv9tSgfYQ=; b=kNMCI6T+nATvQaJaYjSQ16Jr7J
	yRCrteKOLo0EFyi9hgDaA7nUH64TDtTqCURmTzpY2x0sQXbnoVPVtufkW+g4fft39mFfgbApslWQT
	fht+qeW0FQYsSpQT2Zp6tXddqLFuHpP4t96UDV62Pazr9vVGXOj/LtUupK6h9MhHAUlX7KjXQ8vzn
	wd8DGh0nXh6n7X2mfkMncHzha2sVS1KPaoFEpaC9EcQeTNvL3EzRNdAn3FFdJeqMH47ZJvkzb/EVt
	DLk7v4nmHskLZiqcM65cP4GAMdsIrCv3uSzfcPj6+zw/o5lx6Om51D/q9k58JLHu0IzchKxfgiHI+
	FkI1rLeQ==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUtH-0000000DhWx-0oSF;
	Tue, 19 Nov 2024 20:32:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation: kernel-doc: enumerate identifier *type*s
Date: Tue, 19 Nov 2024 12:32:01 -0800
Message-ID: <20241119203201.110953-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explain that a kernel-doc :identifiers: line can refer to a struct,
union, enum, or typedef as well as functions.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/doc-guide/kernel-doc.rst |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20241118.orig/Documentation/doc-guide/kernel-doc.rst
+++ linux-next-20241118/Documentation/doc-guide/kernel-doc.rst
@@ -533,6 +533,7 @@ identifiers: *[ function/type ...]*
   Include documentation for each *function* and *type* in *source*.
   If no *function* is specified, the documentation for all functions
   and types in the *source* will be included.
+  *type* can be a struct, union, enum, or typedef identifier.
 
   Examples::
 

