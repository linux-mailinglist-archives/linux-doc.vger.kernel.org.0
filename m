Return-Path: <linux-doc+bounces-62533-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 48251BC0A30
	for <lists+linux-doc@lfdr.de>; Tue, 07 Oct 2025 10:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2E2834CF5D
	for <lists+linux-doc@lfdr.de>; Tue,  7 Oct 2025 08:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657182D481F;
	Tue,  7 Oct 2025 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoU6ZAZO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61E2D4B40
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825960; cv=none; b=l1Ji29awnQwGIbYR4xy9HTIaUuqi7YatoRA7uLnr68dLXlhdBwoAWX/G99oMfYrmDnUwoBirelWetJ6+FEomFgUButuuFYb1g61B/BtNhwpnHaeATyDHdUoqxUUaBXgNlAPgV6nNT62rL6cuPjehc49aOQRO54Ot0XS7bDuqqQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825960; c=relaxed/simple;
	bh=UyXS0YiulfoICjWKVbZLAuV+X0gt4aJvE3oK8qyJ30E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjOvDuUETMi6YC91Cl1dEA5hxCvejdA3BFJe3o1gLlK+4Y+ghkNnTOo7X+z5ylEHjoqB4cZ0FP3wjIXxgEvcnJ7aNz9N86+YogNo5K04p8Rnw3CRxYSNpKzyVLgUrDEA04WKEDOC9FNjf7o9syfZYFkjT5KAg3xJGovfQwZhsg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoU6ZAZO; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso4622279a12.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759825958; x=1760430758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HprILVmlCINZEM+NQvrClrUcjHEMUlllXqO7BPuLx90=;
        b=XoU6ZAZO2m49XN1+y/2A/M2ZAltddjpHTRHuEyzKt7SYujeDozV9R+lZtcXwivtS8Q
         aYX5GdTtVj5TkneEpWtZ4N3eBl7Ph2zOndVvZEQ4FSYV4OCdNVdQu0w5Gr9s8ZdQI0cp
         tpE15928EVab++85xjbhvN5da9Sx/rEavxisbqg5UyFGPI/pSG6W0suuxGlLOAZdoHGQ
         pGL7OrfwMNRzz/bgTqACZkRC76pS7oE7jxi3gvkWSQp9w+8srbzykdDWs4aJu29VRZNE
         MKcxunczgINFyogyfZRJySZFynh4YrV9PBRTW4agGAuHx1BCMS8zqh3eVud9E2ktXKvl
         NxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759825958; x=1760430758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HprILVmlCINZEM+NQvrClrUcjHEMUlllXqO7BPuLx90=;
        b=GZPy4Qa9yN4YdoMdUF3bjEELy4QAerr8xlyVwa+4k9zxISLabXdwbktJWDBCnfdecG
         JM2fLrHrUXAkt0u3krO9ol/EW+gZknVqm3u2U+ie1zCDwJ+hSGQrUQS3z9JFmK1aV6qI
         bv0WHbJICh22BnfCctNv23zRRjjXfdl9FdEndmxsDKoxH9IiXHN7nHay/woK9k7p6JZO
         4DKLdeHRTpBphmwfj7L0infGAB9iBF/KSbPfZP7KLCQ1BX80KX3eP3ljY37eTUXOexYO
         HXkpHC5X5dXuvioxnpQSkV5Z695OG0ZR8R8N+l55Ev558fywe8UPHlQFf+4WGxhwosag
         KmTA==
X-Forwarded-Encrypted: i=1; AJvYcCVFfkHuiAhz+FIZYVWUF0um1gM6GETa5RuEAPfso2DjMIB62tgujJvAoYHPWNyKrJZpPIF7J0qSjFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJhlSj9ejb+6M5cfy4GPc1Ic1eUc7t51zXha4O/4LBAq6/ZdJ
	MUWXgJ16qOELCf0TdEXtg+Ryrfe2FyTvwj5ZmsK3bJ7IIdzTSNNAkrxZ
X-Gm-Gg: ASbGncvTeJ0wILmJo+l3Mm3K+Ddbt0LFtfPLWjZ03uO0nX1Uta5RVk55Ix/nlIhKk+8
	YRNV/EMiXoPTKLSw8o18Z4I/pyrAqjyfzheCjNUmbC+BVwziKvh1htpC7OyL7PS1+yfo+c2XLMI
	3NH4ZIghAPX2pu1dmopA2JuiXnIPVXtI63/XDyvPufTlNM/wUSuNBBpz7JNT4ltHM7CTzeLosDl
	KoB3bYy1e0RERZLgowkS/2OcKo9xjWRnk9RRmxyHAWO3MxUvcUbzeD8AwcWYEKjN67012/paVCO
	7uMuITR3ucwOQHkuRdGFxp/gvAbhmRItmDFLlRtXqoR/8W9/giqnQ03hbnv55ErT9sMM5vyCF8E
	ckGdenyyyYiKJqX/Uj51uY67oUCNqAhqyFjY4IrK/y5WF87rcS3pXFVas+LTwXgA1qQ==
X-Google-Smtp-Source: AGHT+IEQinegNp0eryTjEE/PSB7WT+WxKJi2rEkoILL6p0tSCG8SZofKeGirNv90BH6Yz68RvHxRpw==
X-Received: by 2002:a17:903:3c25:b0:28e:9427:68f6 with SMTP id d9443c01a7336-28e9a593d32mr183371865ad.27.1759825957801;
        Tue, 07 Oct 2025 01:32:37 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d24aesm157032525ad.118.2025.10.07.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:32:37 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] Documentation/rtla: fix htmldocs build error by renaming common_options.rst
Date: Tue,  7 Oct 2025 14:02:26 +0530
Message-ID: <20251007083228.17319-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build errors for
common_options.rst

Documentation/tools/rtla/common_options.rst:58: ERROR: Undefined substitution referenced: "threshold".
Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "tool".
Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "thresharg".
Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "tracer".
Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substitution referenced: "tracer".
Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substitution referenced: "actionsperf".
Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined substitution referenced: "tool".

common_options.rst is intended to be included by other rtla documents
and is not meant to be built as a standalone document. It contains
substitutions that are only resolved by other documents, so building it
independently results in 'undefined substitution referenced' errors.

Rename common_options.rst to common_options.txt to prevent Sphinx from
building it as a standalone document and update the include references
accordingly.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

Note: reStructuredText substitutions -
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#substitutions

Tested by running "make htmldocs" before and after the change,
verifying that no substitution errors are generated and the 
output renders correctly in browsers.

 .../tools/rtla/{common_options.rst => common_options.txt}       | 0
 Documentation/tools/rtla/rtla-hwnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/tools/rtla/{common_options.rst => common_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_options.rst b/Documentation/tools/rtla/common_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_options.rst
rename to Documentation/tools/rtla/common_options.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index 3a7163c02ac8..cc2721315552 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -33,7 +33,7 @@ OPTIONS
 
 .. include:: common_top_options.rst
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 EXAMPLE
 =======
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index 1fc60ef26106..a11c485f127a 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -28,7 +28,7 @@ OPTIONS
 
 .. include:: common_hist_options.rst
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 EXAMPLE
 =======
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index b1cbd7bcd4ae..c7bc716b2899 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -30,7 +30,7 @@ OPTIONS
 
 .. include:: common_top_options.rst
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 EXAMPLE
 =======
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 4923a362129b..547dfc7ace58 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -29,7 +29,7 @@ OPTIONS
 
 .. include:: common_hist_options.rst
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 .. include:: common_timerlat_aa.rst
 
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 50968cdd2095..3740fd386ea8 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -30,7 +30,7 @@ OPTIONS
 
 .. include:: common_top_options.rst
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 .. include:: common_timerlat_aa.rst
 
-- 
2.43.0


