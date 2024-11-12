Return-Path: <linux-doc+bounces-30587-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE09C6230
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 21:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B43B41F2455D
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 20:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B026E21A4B2;
	Tue, 12 Nov 2024 20:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqnIm1ue"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A2219E5A
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 20:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442093; cv=none; b=jcY8j3NVTWukdzNTWyiNTh0ewo0FbRSpkRjj5vSVIWo1uw+1wtQd4kgQzWybXYz3elho1wnF40oDoSobQS0EVAkSHj+aIfjbJpPQH1Jx2fFaleXwpOgMckb9omj5Cb+G4xeQQFntC4ct2ksvgJRDzZ5c5w8pWbgSqzXQKLN15Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442093; c=relaxed/simple;
	bh=B2BZlLToTUAjoVWiSQSwNAS8P01rAmnOoNV4PHC+xME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j94uiBhior2XhCYHDADD4xfWZeib0o2QQvUahJ1dJIFME9aVesyGx7Bq6lNOHAG2zJNYV5WRpy9WSq4Ek5qYcX09ODYHcgueY0b0YGKV8xBrAMAln5BSjyybfqfk12E22///GzTc/UYvXQYiG95unWtiMrjzNMesj5rvQhjTyIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqnIm1ue; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea7c5805ccso92551427b3.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 12:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442091; x=1732046891; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLdLdld0TfKxmW0hbDEs868Z4miMeCQgcxYojucNxMY=;
        b=EqnIm1ue6AMluRbMR86uCkEK9779obZemRDjZWdu7JgkPH7fJ2IcBVMbVYYW5Y1mPF
         TZMnBAK7lDRQXMc2m7aQcAEwOfPEgomLP+89+Q0PyoBVLhHLgILntyDMpGsfwo3/G/jx
         AmonKiKnthAVaDYj2y8XXGHt75K7G8GD9ICmWeF1mgJk/8a/mz5tgV8PWhLLMuY9Q8sT
         LwiPot0uGPL2wkj6/UwP2Uwij9vNGsAKcnOyPqgcKgZYFaKt6GG7IvZRqIGHV94kLe+o
         kURsokE5SM4EZMlC/in9FFotGhqyXtJrKWy4n0wEmByPsbUJ+eQOevsQwXyh6Aey0o4u
         vlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442091; x=1732046891;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLdLdld0TfKxmW0hbDEs868Z4miMeCQgcxYojucNxMY=;
        b=LuLnMXJxgsKmridnLQC56RSsvLjxx5WOoEfFbtDdkmE/+PRS5lh/LUebZDqdEB6NDm
         cqOnVKyC/dFvkmPVNURG/H/b5LM5DaKVrhiGBMJaQzEFMQtr6aOifEzcC+mIQOXvFC72
         lEawYXEHthpaCny5Zb3JwKOyrFLgc5Bd0C2av9DLwUIkrtHl+su5SKQ/nPUM7boxYlqy
         ji8MMD4Jza6RiwJ9hXAOVxs/kO0K9Sl3gGGMX2ZW5XOztQFe5I+BFtWXPcVF2Up0YwRT
         jMK3IHlTSEtsxYxnslIAwojFwpRZ38zeblhtZY/5VvDbovY/fJbh9JJT9xNv/wGlRYXW
         tnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSWpgRCZW4PvTgLphf4Imh0W5yJkajuDHBL1esDg2HbfKOkgPKan/xywcQThWVrdDL4FwjlWtNHP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5PqwhdKX2t6dLJKIWohwrzX8RSdPf2rAygZYdRQIXcCmZU37a
	blI99KEltJIQJmT8eILcq1xRsDvNm2mnDI8iSfApxxSwxUCTrWAsSc2oInVhsdL/yIHzth9neQ=
	=
X-Google-Smtp-Source: AGHT+IGGLxhy/xfGywcyzjSFou+hNr9cGpfKtubs2n9Br3Ll18e1mbZqoMdRM1c0fxSfULNH4+V9bbUbIw==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a05:690c:64c1:b0:6ea:1f5b:1f5e with SMTP id
 00721157ae682-6ecb34412abmr6067b3.4.1731442091073; Tue, 12 Nov 2024 12:08:11
 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:45 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-3-rmoar@google.com>
Subject: [PATCH 2/5] ktap_v2: change "version 1" to "version 2" in examples
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank Rowand <frank.rowand@sony.com>, Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Frank Rowand <frank.rowand@sony.com>

Change the "version line" in example output from
"KTAP version 1" to "KTAP version 2".

Change version that should be used by compliant tests from 1 to 2.

Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 333193f51a53..c8f83a7bd470 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -39,6 +39,7 @@ version of the (K)TAP standard the result is compliant with.
 
 For example:
 - "KTAP version 1"
+- "KTAP version 2"
 - "TAP version 13"
 - "TAP version 14"
 
@@ -46,7 +47,7 @@ Note that, in KTAP, subtests also begin with a version line, which denotes the
 start of the nested test results. This differs from TAP14, which uses a
 separate "Subtest" line.
 
-While, going forward, "KTAP version 1" should be used by compliant tests, it
+While, going forward, "KTAP version 2" should be used by compliant tests, it
 is expected that most parsers and other tooling will accept the other versions
 listed here for compatibility with existing tests and frameworks.
 
@@ -202,9 +203,9 @@ An example of a test with two nested subtests:
 
 ::
 
-	KTAP version 1
+	KTAP version 2
 	1..1
-	  KTAP version 1
+	  KTAP version 2
 	  1..2
 	  ok 1 test_1
 	  not ok 2 test_2
@@ -215,11 +216,11 @@ An example format with multiple levels of nested testing:
 
 ::
 
-	KTAP version 1
+	KTAP version 2
 	1..2
-	  KTAP version 1
+	  KTAP version 2
 	  1..2
-	    KTAP version 1
+	    KTAP version 2
 	    1..2
 	    not ok 1 test_1
 	    ok 2 test_2
@@ -250,21 +251,21 @@ Example KTAP output
 --------------------
 ::
 
-	KTAP version 1
+	KTAP version 2
 	1..1
-	  KTAP version 1
+	  KTAP version 2
 	  1..3
-	    KTAP version 1
+	    KTAP version 2
 	    1..1
 	    # test_1: initializing test_1
 	    ok 1 test_1
 	  ok 1 example_test_1
-	    KTAP version 1
+	    KTAP version 2
 	    1..2
 	    ok 1 test_1 # SKIP test_1 skipped
 	    ok 2 test_2
 	  ok 2 example_test_2
-	    KTAP version 1
+	    KTAP version 2
 	    1..3
 	    ok 1 test_1
 	    # test_2: FAIL
-- 
2.47.0.277.g8800431eea-goog


