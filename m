Return-Path: <linux-doc+bounces-7233-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A57837DB9
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jan 2024 02:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A5D2B2B10F
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jan 2024 01:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04671474D1;
	Tue, 23 Jan 2024 00:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S01NyATJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9091474A7
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 00:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705969716; cv=none; b=u1r4EwbrN71FzZfIaUBbS9PbouAKn9fo1B2Pud+lhk4dhpc2EVY/Aa+SEx0e6FfN8eXwRlQKx6M76zgzT4ZQ2QeNuwXKMrMmmJ5Fwb72ghaL9xQa2SwdlSh7jxzx1uHPz2ty7JFuahIM3qVNLFv3mP+wiKez0+VmwWGsMlmzgmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705969716; c=relaxed/simple;
	bh=+WA9Ct7l0slkMBBzNWpIPaSatsWk1P15wygbjb7RsC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fX7IFnLVObUQ/8QIBc+6LH/7UraSR9OTIS+2v1F/Hj7fFgx8NqZCLRy+W0EIw9zZXDkJiLG+siklQ0ZWhTkg1Pm9qmIdCKRQQ322bYYpkl9Q1l/4X5xdusPb/u/tiQjIyQ9x2v+WfK24IvXISkTJ0bX0w2hoZHP/g/F/2zOTv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S01NyATJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d6fbaaec91so30352485ad.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 16:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705969714; x=1706574514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iepksXH/P2CFRPbU7KRUTTSDHuc6hLdiCJiseIVsFEY=;
        b=S01NyATJigLb2mLJpyjE33kRdf85I3Wf/nPkxVh7yDLUDdybZJ7AWdJ5I9kgEXJpV3
         kVaxs2UfcoKXhMM4OinqBGg+lc7hYcnBfMfbKB5hMjpHnOalQbZSw+NYIeGPJaZZjeAz
         C4nPU/miZEAGTjkPeWiYBj8UHpwiYe+PtrzKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705969714; x=1706574514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iepksXH/P2CFRPbU7KRUTTSDHuc6hLdiCJiseIVsFEY=;
        b=fnyWcJf33jfBNZNsB4fIPms+agsNo+ciR6Kq6Z1kbR7rP3yS7I1u9pIuIBa7K/eQ+G
         F5g5CXhd/g64mcje6JVztcgc6cN2f7H25PU1PIabKUXO859vCaS6QssHG3Ik06vz4OxE
         GIPee0FbYBVwy14osXKYwGLxFYc9hqdgl9cwl/vB7PUEmTYXqH+lq+RBb2rRrDF+G+dN
         NNuucvxTixQrn1OhV9nLK/G6iIAJDcL2v3AJQckbNh8r0YdR5+kwCn3R31l1v0IrwNd1
         6SD/5IWKhsGzaqRKqKNxKfkcRLGNgyoHvY2MdK0agi1/FqwochOHyeyglxxwdrlXkXsH
         1VNQ==
X-Gm-Message-State: AOJu0YzQYkAqWsiVo3QJBgAc5/1AjpPLjZVzi77aSn88geAH6XlLdmJs
	Cnq8Gtjoyi2pafqjMhdxXJ+afsJutX06FuwjVtjicO8PPRu/p2YBZCuL3XNlKA==
X-Google-Smtp-Source: AGHT+IHzJfASWaHfc51wxjaPWnFJN6LIKQPulmtu7uPPGg4rctyOF85aFxL98jV7B3g96+HViVRi3Q==
X-Received: by 2002:a17:902:bf43:b0:1d6:f240:91eb with SMTP id u3-20020a170902bf4300b001d6f24091ebmr4675643pls.105.1705969714532;
        Mon, 22 Jan 2024 16:28:34 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jv13-20020a170903058d00b001d72bd542d7sm4491222plb.139.2024.01.22.16.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 16:28:25 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/82] docs: deprecated.rst: deprecate open-coded arithmetic wrap-around
Date: Mon, 22 Jan 2024 16:26:39 -0800
Message-Id: <20240123002814.1396804-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640; i=keescook@chromium.org;
 h=from:subject; bh=+WA9Ct7l0slkMBBzNWpIPaSatsWk1P15wygbjb7RsC4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgEcKz/IVh6AHW78ErpCaprSPaxdFMlZJU/p
 nEc33LkKJKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8IBAAKCRCJcvTf3G3A
 JhDJD/4/hiDapZrRx3IUC8fORd2j7RQere5tpaqVjlU5VBEohjnZfgBrSaXLPJD3ittOSfiXpTV
 qwoChxq3tWBiw0rfSBAYOH5WTvj8crGO3YuggDjqh4H5lWZE77jcjns+LHN4vk56akzliSAXuZv
 VpJFUEbbPanlEo7ifJ9/ad7kPFB9q8vay7oT5hyuXlwp2drF/8gXQm+OisW84paPv9aM7FVgdSK
 BOXiuS6NzexkgeL8ppxZpxnGFruM8P5k0nKF6E+MskMuhJdeF7ZrwT9dFIeh2ZXUSNJ4k2Hxm9J
 hOaRQOVTLjPqkpfWOZKhvx4v908ITNUY0cicWNEJEXCDJzfpqMigkbIcLkrQ5xJk+7Mes5FAOdR
 fff5zKQdAT9bOjzhNoB8jjFopHoZ+gCVG4UoKKaHT2tx+gL2UnntgHBN8ErFZXqPzjO3vL48Vpy
 6zksiU8rnxZJOwYvYhiKE/0cxuoLBZh8MxA1OChyYAd+/1b2opzH1Xt/LXRZBz74jkFjCms7dpT
 U8+hjmblmd9nBpW3KwV3tVsXLztPgCXvBPZmoQp+0WaQPLGoqe0NE113GE6RGQyuaNN8QzmK3RK
 bPN3+gpjk7+hsX8K8CgR5LtYZJ0RCqkseGqMTmep+SuHpjigvNLo7eykHRtozTskavBta9U0tGc WLmj1ykhZxc4g5g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In pursuit of gaining full kernel instrumentation for signed[1],
unsigned[2], and pointer[3] arithmetic overflow, we need to replace
the handful of instances in the kernel where we intentionally depend on
arithmetic wrap-around. Document this goal and provide an example for
the most common code pattern, checking for simple overflow:

	if (VAR + OFFSET < VAR) ...

Link: https://github.com/KSPP/linux/issues/26 [1]
Link: https://github.com/KSPP/linux/issues/27 [2]
Link: https://github.com/KSPP/linux/issues/344 [3]
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Cc: workflows@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/process/deprecated.rst | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 1f7f3e6c9cda..270f3af13b86 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -109,6 +109,38 @@ For more details, also see array3_size() and flex_array_size(),
 as well as the related check_mul_overflow(), check_add_overflow(),
 check_sub_overflow(), and check_shl_overflow() family of functions.
 
+open-coded intentional arithmetic wrap-around
+---------------------------------------------
+Depending on arithmetic wrap-around without annotations means the
+kernel cannot distinguish between intentional wrap-around and accidental
+wrap-around (when using things like the overflow sanitizers).
+
+For example, where an addition is intended to wrap around::
+
+	magic = counter + rotation;
+
+please use the add_wrap() helper::
+
+	magic = add_wrap(counter, rotation);
+
+Another common code pattern in the kernel open coded testing for overflow
+by performing an overflow and looking for wrap-around::
+
+	if (var + offset < var) ...
+
+Instead, use either check_add_overflow() (when you want to use the
+resulting sum when it doesn't overflow) or add_would_overflow()::
+
+	if (add_would_overflow(var, offset)) ...
+
+In rare cases where helpers aren't available (e.g. in early boot code,
+etc) but overflow instrumentation still needs to be avoided, it can be
+replaced with a type max subtraction test instead::
+
+	int var;
+	...
+	if (INT_MAX - var < offset) ...
+
 simple_strtol(), simple_strtoll(), simple_strtoul(), simple_strtoull()
 ----------------------------------------------------------------------
 The simple_strtol(), simple_strtoll(),
-- 
2.34.1


