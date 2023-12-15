Return-Path: <linux-doc+bounces-5156-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663A813E9C
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 01:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E766D2837C5
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 00:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EB153A0;
	Fri, 15 Dec 2023 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QpluNX1F"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5615382
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 00:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d351848c9fso237435ad.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 16:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702599295; x=1703204095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ev3Eb+ZV85HTlWtAyzOBUHGpbBJx18XoGsZ8JgWiqC8=;
        b=QpluNX1FlvOioywUAbxINcLZzpOwHBPA96hPaBjGxXe9xA/LyK27sWz745302R5mpK
         HwZgMNnSdhS0UBn2lGwqAaEvpmIxObANQc8f0sIh/Bw2aqIOuyxHiMrovr+dstkMc2Ot
         eBNxeyquluuSPRnq01gbUFEj7NK5Wv1J3bVX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702599295; x=1703204095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ev3Eb+ZV85HTlWtAyzOBUHGpbBJx18XoGsZ8JgWiqC8=;
        b=PAqiAxmcO/ZoP9sfYbG46zp8+tbAll6CbQWBmlOvvltqjtSVlZvo2sfEdYZWFpSq+k
         AUtqrpQ4MLFG8GHtYwe7X3RddYy4A5+xVf69HtjSSER+pw5l7Yu5k1qJhq1pZs6suTL8
         q0nrxnpBkD3O57fpPESuFiuL4r55q7ajThQtgYoA/YVowS6qUYwxT7vB+pnS0Tnd6tn2
         1vFCn0lxOTj4HX5NdCQCHKQ7tCKJYBhQfxZb4jIkAU+o/ef4T/h8QqsT89pNj3RmuH1R
         wrrkP9WdI1ypfkyuB/pxvxJrHvrIS0qhK+e+DFT5UzKKh1LUHW0vkMYMzCkUTQOMlxkS
         bR9Q==
X-Gm-Message-State: AOJu0Yx/kQd4WEeqpVcnn/YRQ2EpafwKatFhRNX4EpdtijrYEkicAY+H
	2QLdt6mFwqQuASEDzrCCzQ61YA==
X-Google-Smtp-Source: AGHT+IEjme1NlA6HgwwpB7VS/MhvOHGjbseMV65BUYmIblPAUxil5uGyIbj6X2fNw//Em3FmDKok6g==
X-Received: by 2002:a17:903:2303:b0:1d0:ab57:2483 with SMTP id d3-20020a170903230300b001d0ab572483mr6164845plh.98.1702599295303;
        Thu, 14 Dec 2023 16:14:55 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902c19100b001d352a496c1sm3668670pld.295.2023.12.14.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 16:14:54 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Kees Cook <keescook@chromium.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] scripts: kernel-doc: Report excess struct member descriptions
Date: Thu, 14 Dec 2023 16:14:51 -0800
Message-Id: <20231215001451.work.746-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=keescook@chromium.org;
 h=from:subject:message-id; bh=DsKC5d7CSbsFqjMtjY54c7l6d4gHSd5eMJH8lGLCILM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBle5p7kFwcR+6Zr4eXM4A9sR0wpYZoCKJVSj19A
 HKrKcGjPuOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZXuaewAKCRCJcvTf3G3A
 JglID/926jj/4/4MRA201XHEL8z/RFF8dzGN29wtLTO7VSlu16zXONJ1cFL3O78lCO6+aoL+p6D
 LiEdBfm+eWgzO/3A4CGt7W6GEg0P6Bi9kav1WUNN5TjH/qtIIWFEqTKqM+vCI6/8UPNLnvm4uwU
 AWPWhX3O0mVD7Exw08YroCwrLHprq9+7UKYHBiayW3JTjflXYgM8RB3jeNuI7vtL7sOS21xrT8Q
 IxrS9H8lfe0K8HItfd8op6dKQFFN9Oi0pPsIavOUbQNeqM2kwNnwi0zBFzDd1MYU2YkuHUuzkYO
 qlQ9oMJSu0nQcalKsQtjSa8GGIv6LN3vXJilmj8t7p2pjiCsLsavB+YeOATwJFL2+hsRfo07dCa
 aGpvqffvjjwrUwp8DMc/TAeEeQIuwa21YspBGUbYcOpKvGDqDzFa3bN/wQCSlxwem5qpwc3RpCl
 fdD1olKKBacbx5Hov+E64bJtnggvkd+eWFik12U5tjc5bdFilwyif4gooVbSgCPvLZWpxbm6Rs3
 CsQcnbhZFyKp95brTHhhva22cMZ4Px02g9YnhADZ8LuiCzJcHM1LSH9bly/znIAsF1wosVwJ5tw
 6f2W/EPWowJKm6Kd2jZmtz9T2E9zSHAVdxKe6wr58QzQv17SzgCjs1R1LOkXzL7klYskCj5QS4r
 c0PI/rD 11T39bbQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

While missing descriptions were already be reported, missing struct
members were not. For example, previously this output was empty, but now
produces:

$ ./scripts/kernel-doc -none ./drivers/leds/leds-mlxreg.c
./drivers/leds/leds-mlxreg.c:42: warning: Excess struct member 'led_data' description in 'mlxreg_led_data'

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/kernel-doc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 08a3e603db19..39e730ee1fef 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1265,6 +1265,18 @@ sub dump_struct($$) {
 		$declaration .= "\t" . $clause . "\n";
 		$level++ if ($clause =~ m/(\{)/ && !($clause =~m/\}/));
 	}
+
+	my %_members;
+	$_members{$_}++ for (@parameterlist);
+
+	while (my ($k, $v) = each %parameterdescs) {
+	    if (!exists($_members{$k})) {
+	        if (show_warnings("struct", $declaration_name)) {
+		     emit_warning("${file}:$.", "Excess struct member '$k' description in '$declaration_name'\n");
+		}
+	    }
+	}
+
 	output_declaration($declaration_name,
 			   'struct',
 			   {'struct' => $declaration_name,
-- 
2.34.1


