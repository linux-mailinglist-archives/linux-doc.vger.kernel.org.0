Return-Path: <linux-doc+bounces-30030-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF079BDEDA
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 07:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D00281A05
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 06:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BE5192D63;
	Wed,  6 Nov 2024 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="ECRbCt83"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E3219259D;
	Wed,  6 Nov 2024 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730874550; cv=none; b=kNJjcLHu5xcYk2lettItU4XPwY29mztCQrscQL13whC3oI0kbgAjZVtmlTPEH7AR5zrdxNnuqeljBt+Tdm7HGl2jv/fvkW453/erTHS0j4za1qFOD3lWhYzJzPL3DpgDy9WqJEIZ+P/eYxfe72NNAUmgFgFcunstPDRpS8bIB8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730874550; c=relaxed/simple;
	bh=dQgcGWUvfOu5xpeBNFHrBzxUtWgdyqujDCKQfFq6Dkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFzTTqPUKFXgXZ7U/x9iGxtG+mSWQzUSWoOm7RuUr1g3MJ+OX+FP6V8OUoGaUm+JSggOEI6Wenlkhxqs/flgl65WiVQR8qOUQeWiO/uTUerlNXq36vYlnsH3RJuDFtWPU3pCVBuc9ioB06dmQAEoJWpQ9HK2tGXGcui9g5o8og8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=ECRbCt83; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730874541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKylLYA/b4uX/rCkAgwCAqhzPmE0mtRHuRn9J/WQvog=;
	b=ECRbCt83YvrrNDL67JttM61Lst+t4md/GY9YFVLN+gmQsSCDKcmziFB9z5xqANkE18wSE3
	iq1h0cekEZOeZwwppdE7hnWhaB0ahMAA0YU2fdzeUTUVywl1HFmHduSmsts6N+KibRzx70
	PoThe9XD9cOMUVGJseTJIkzWZE8lVfp4SVv58aIx6xWnmvMZwEoHQAR+x20ogApTazwhvC
	XNJspnT4jR1aUnpBryp/iPSIcdcXI0LmvhkSxanzhrx+tOEiA8IGoNcXDsC/FDL26eBq8e
	SAI1jo28Us7c+K5NY5/mQP1bZwHuzkCTvkid80MvXco3sXODClEaICFT9mqm3Q==
To: apw@canonical.com,
	joe@perches.com,
	corbet@lwn.net
Cc: dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	wens@csie.org,
	dsimic@manjaro.org
Subject: [PATCH v2 3/3] docs: submitting-patches: Describe the use of Helped-by tag
Date: Wed,  6 Nov 2024 07:28:42 +0100
Message-Id: <55056f4ec0365c67576a1e1e3162b0cfeadd1c6d.1730874296.git.dsimic@manjaro.org>
In-Reply-To: <cover.1730874296.git.dsimic@manjaro.org>
References: <cover.1730874296.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Add the description of the intended use of Helped-by tags, which give credit
to the persons who assisted the patch authors in a way that didn't actually
contribute to the patch directly, i.e. at the source-code level.

Suggested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 Documentation/process/submitting-patches.rst | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 382c49659cb9..d0d12536ab68 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -452,8 +452,8 @@ as it was propagated to the maintainers and ultimately to Linus, with
 the first SoB entry signalling primary authorship of a single author.
 
 
-When to use Acked-by:, Cc:, and Co-developed-by:
-------------------------------------------------
+When to use Acked-by:, Cc:, Co-developed-by:, and Helped-by
+-----------------------------------------------------------
 
 The Signed-off-by: tag indicates that the signer was involved in the
 development of the patch, or that he/she was in the patch's delivery path.
@@ -495,6 +495,14 @@ chronological history of the patch insofar as possible, regardless of whether
 the author is attributed via From: or Co-developed-by:.  Notably, the last
 Signed-off-by: must always be that of the developer submitting the patch.
 
+Helped-by: gives attribution to the persons that helped the patch authors
+in a way that didn't directly produce the patch itself.  For example, someone
+may provide significant assistance to the authors by researching the schematic
+of a device that the patch addresses, or by providing the patch authors with
+some background information required to develop the patch, while contributing
+no actual source code.  As a result of no direct patch authorship, no
+Signed-off-by: tags are needed together with Helped-by: tags.
+
 Note, the From: tag is optional when the From: author is also the person (and
 email) listed in the From: line of the email header.
 

