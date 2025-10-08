Return-Path: <linux-doc+bounces-62741-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A97BC651C
	for <lists+linux-doc@lfdr.de>; Wed, 08 Oct 2025 20:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A21994E63B3
	for <lists+linux-doc@lfdr.de>; Wed,  8 Oct 2025 18:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C8E29BD81;
	Wed,  8 Oct 2025 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdJXDdh/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B621E834B
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949142; cv=none; b=DlnzJCtBW91Fbj7IOH0PepuFIqgxbXEy10Zp+2Xjw0kOu0NC/J8quISoGZ11ftcjHs4h0q2qwGf6LuLNHwpe5YVqswxxXAwwc9p27v2y0y0GI4AhFnH2ogAq4PbTkuESHcuU9uBb+bqRtwxeii1R81g7nPhYIE+OAjD4P6Y/hdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949142; c=relaxed/simple;
	bh=edXk8mtRHT4a8ETEoUk6fnwmMYrwd+sjN5R/6vm0mR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X47TcksusESXnfL2/rR4PT/XkDESwKThd3onDAhb8QCkIqPFJoVxx76g5aPoTbXiHyorECDLEqgzUyL8rIOCI/lW0TerldUHv62xvvKMK829FjtJmSlWlVrK9VWhl7LlecJlGpEjuy0fuqVW484LYAO1uDiBiKMuAD8Y1B+nO/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdJXDdh/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27c369f898fso1644795ad.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759949139; x=1760553939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKFx0l4hKy28sNRGiaGfhcTL+cuug9ElvubKP0ftiiA=;
        b=QdJXDdh/GshcSTpdRFT780eJDYirm4VuIJDYYOzIR9P6iYcL9l7g3yr3j4W5Yx6eeA
         FtWqYNwd69byncgbvcNGLDl06vPJHyzwana5dv99UGXrFEmUXhgTe6IcT8mOcen26ie5
         lsn9p5DpxQKERtDoy6nNTvRMknd+ZBDUNY5sumrtA7f9Spa3OBgKCCuMbp6NUYlWo4si
         kwoMPsLonUEIvsy75tmNT2K9rwpOx1tmf6ni5hDWKHJPcrbD7iGOlW2pbOWBi7J7K/1i
         wXAfiCfTPcAqNtpcWGrUSLf+ymi4yb8zIitEIlB75d7zJ9JRYmi4aoxxue2JzD2B/mjX
         23YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949139; x=1760553939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKFx0l4hKy28sNRGiaGfhcTL+cuug9ElvubKP0ftiiA=;
        b=qUbV2cMWeduvJ/AgLFogqb11GiyCxaAIINqfvRtBUsIWDJQWdsqche2mFToucVaSn6
         VnSKfTvAW1ooguNTa+kaMhXErhJyKWVyqYiTd/XfDaL2nt6+bur016IJs+WEqw1lKLeE
         CYS09qjblNZQAxABnQRP9xhAZmGnD6PqeMOQRrBtmGvmVjLZF9C4Q9jEfv6AqIYEHQRR
         Qh1PoTxBlxuZAtyySeqoxfbjZrKUj6+51sXvAVavqitZ5laBEoFkztP0+xsfGBgp27/s
         RRIDPM7DDkrr6KpCskOuNuJj7442rUQuYFRyxSqdizBgJTFJnU4kSf1B5BU7qFjOqsHG
         SKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL4BciO8pLwv9IhPp85DI0uAny5f+8q/sY05X6W1iMNT9nxpE6hQ0OHEKQE0AHG6NMY4Wvz48HX0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTD5/qg2BsAcT22Xka3UFUZzUagv+KDKh87SkbscVRImuG5vZ9
	JrgzhhdK8Vj7Mv4IX+i4xE4Z74ZfwJF1xu9x+FGmRiDJwAX/cgc3nead
X-Gm-Gg: ASbGncvRSWpzPiVLIRyoYAMAbY9R1hgWKjLroWdc5OIa1U/ResuoCO6gTD4rLfR+OMN
	AdeRcKOOt9RqJIDIUiQTmhjhECC2KIU4baVMu97qGILIlq0yFkYSNfQS6IhDMyjv7jTimsgm08h
	OVvYwOyLk2kwzVvxCDIXfofOx4VO4p7i9Oh0wa+dvIPBfdq1Xbdqn4WuBcjnwxVLat/2YpVw6Sr
	PecRODz+p9HyVAnJ1ihzd02RuSwDngd8UAZIlYUpjMff25WyUhQ0fZ2bJ9KzeLqK5YkrmGc1P1W
	wXD7nzk1L6p0QbIbWWym4p1c/t3YB4VlWZ6rYPis31W0pQeN4/tlPx88nMOm6dQlGVkfxc6wqRY
	a5SdJYG+izEqKNm6fRE13IOzD6ALiPBqjxm0G8Fjg9dQ9DtrRdV5ZGfGls63jhTVpFg==
X-Google-Smtp-Source: AGHT+IEd5WiSyo2hmpGstizzrex7tB8cFdu2ns5Jd22RUeKtlhdiFjAbWyQDibswlubOmwWAnvx9Og==
X-Received: by 2002:a17:903:2f84:b0:28c:834f:d855 with SMTP id d9443c01a7336-290272667bcmr65196645ad.27.1759949138787;
        Wed, 08 Oct 2025 11:45:38 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36929sm4218175ad.95.2025.10.08.11.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:45:38 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net,
	tglozar@redhat.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2] Documentation/rtla: rename common_xxx.rst files to common_xxx.txt
Date: Thu,  9 Oct 2025 00:14:27 +0530
Message-ID: <20251008184522.13201-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAP4=nvTjauRawBPTnGEztZpdDSNhGpgSJtjoTFuq+cCQHP5oEg@mail.gmail.com>
References: <CAP4=nvTjauRawBPTnGEztZpdDSNhGpgSJtjoTFuq+cCQHP5oEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running "make htmldocs" reports the following build errors for
common_options.rst:

Documentation/tools/rtla/common_options.rst:58: ERROR: Undefined substitution referenced: "threshold".
Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "tool".
Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "thresharg".
Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "tracer".
Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substitution referenced: "tracer".
Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substitution referenced: "actionsperf".
Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined substitution referenced: "tool".

common_*.rst files are intended to be included by other rtla documents
and are not meant to be built as a standalone document.
common_options.rst in particular contains substitutions that are only
resolved by other documents, so building it independently results in
'undefined substitution referenced' errors.

Rename all common_*.rst files to common_*.txt to prevent Sphinx from
building them as standalone documents and update all include references
accordingly.

Suggested-by: Tomas Glozar <tglozar@redhat.com>
Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Note: reStructuredText substitutions -
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#substitutions

Tested by running "make htmldocs" before and after the change,
verifying that no build errors are generated and the 
output renders correctly in browsers.

 .../{common_appendix.rst => common_appendix.txt}     |  0
 ...mmon_hist_options.rst => common_hist_options.txt} |  0
 .../rtla/{common_options.rst => common_options.txt}  |  0
 ...escription.rst => common_osnoise_description.txt} |  0
 ...snoise_options.rst => common_osnoise_options.txt} |  0
 ...common_timerlat_aa.rst => common_timerlat_aa.txt} |  0
 ...scription.rst => common_timerlat_description.txt} |  0
 ...erlat_options.rst => common_timerlat_options.txt} |  0
 ...common_top_options.rst => common_top_options.txt} |  0
 Documentation/tools/rtla/rtla-hwnoise.rst            |  8 ++++----
 Documentation/tools/rtla/rtla-osnoise-hist.rst       | 10 +++++-----
 Documentation/tools/rtla/rtla-osnoise-top.rst        | 10 +++++-----
 Documentation/tools/rtla/rtla-osnoise.rst            |  4 ++--
 Documentation/tools/rtla/rtla-timerlat-hist.rst      | 12 ++++++------
 Documentation/tools/rtla/rtla-timerlat-top.rst       | 12 ++++++------
 Documentation/tools/rtla/rtla-timerlat.rst           |  4 ++--
 Documentation/tools/rtla/rtla.rst                    |  2 +-
 17 files changed, 31 insertions(+), 31 deletions(-)
 rename Documentation/tools/rtla/{common_appendix.rst => common_appendix.txt} (100%)
 rename Documentation/tools/rtla/{common_hist_options.rst => common_hist_options.txt} (100%)
 rename Documentation/tools/rtla/{common_options.rst => common_options.txt} (100%)
 rename Documentation/tools/rtla/{common_osnoise_description.rst => common_osnoise_description.txt} (100%)
 rename Documentation/tools/rtla/{common_osnoise_options.rst => common_osnoise_options.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_description.rst => common_timerlat_description.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_options.rst => common_timerlat_options.txt} (100%)
 rename Documentation/tools/rtla/{common_top_options.rst => common_top_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_appendix.rst b/Documentation/tools/rtla/common_appendix.txt
similarity index 100%
rename from Documentation/tools/rtla/common_appendix.rst
rename to Documentation/tools/rtla/common_appendix.txt
diff --git a/Documentation/tools/rtla/common_hist_options.rst b/Documentation/tools/rtla/common_hist_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_hist_options.rst
rename to Documentation/tools/rtla/common_hist_options.txt
diff --git a/Documentation/tools/rtla/common_options.rst b/Documentation/tools/rtla/common_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_options.rst
rename to Documentation/tools/rtla/common_options.txt
diff --git a/Documentation/tools/rtla/common_osnoise_description.rst b/Documentation/tools/rtla/common_osnoise_description.txt
similarity index 100%
rename from Documentation/tools/rtla/common_osnoise_description.rst
rename to Documentation/tools/rtla/common_osnoise_description.txt
diff --git a/Documentation/tools/rtla/common_osnoise_options.rst b/Documentation/tools/rtla/common_osnoise_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_osnoise_options.rst
rename to Documentation/tools/rtla/common_osnoise_options.txt
diff --git a/Documentation/tools/rtla/common_timerlat_aa.rst b/Documentation/tools/rtla/common_timerlat_aa.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_aa.rst
rename to Documentation/tools/rtla/common_timerlat_aa.txt
diff --git a/Documentation/tools/rtla/common_timerlat_description.rst b/Documentation/tools/rtla/common_timerlat_description.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_description.rst
rename to Documentation/tools/rtla/common_timerlat_description.txt
diff --git a/Documentation/tools/rtla/common_timerlat_options.rst b/Documentation/tools/rtla/common_timerlat_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_options.rst
rename to Documentation/tools/rtla/common_timerlat_options.txt
diff --git a/Documentation/tools/rtla/common_top_options.rst b/Documentation/tools/rtla/common_top_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_top_options.rst
rename to Documentation/tools/rtla/common_top_options.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index 3a7163c02ac8..26512b15fe7b 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -29,11 +29,11 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 EXAMPLE
 =======
@@ -106,4 +106,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index 1fc60ef26106..007521c865d9 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -15,7 +15,7 @@ SYNOPSIS
 
 DESCRIPTION
 ===========
-.. include:: common_osnoise_description.rst
+.. include:: common_osnoise_description.txt
 
 The **rtla osnoise hist** tool collects all **osnoise:sample_threshold**
 occurrence in a histogram, displaying the results in a user-friendly way.
@@ -24,11 +24,11 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
-.. include:: common_hist_options.rst
+.. include:: common_hist_options.txt
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 EXAMPLE
 =======
@@ -65,4 +65,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index b1cbd7bcd4ae..6ccadae38945 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -15,7 +15,7 @@ SYNOPSIS
 
 DESCRIPTION
 ===========
-.. include:: common_osnoise_description.rst
+.. include:: common_osnoise_description.txt
 
 **rtla osnoise top** collects the periodic summary from the *osnoise* tracer,
 including the counters of the occurrence of the interference source,
@@ -26,11 +26,11 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
 EXAMPLE
 =======
@@ -60,4 +60,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise.rst b/Documentation/tools/rtla/rtla-osnoise.rst
index c129b206ce34..540d2bf6c152 100644
--- a/Documentation/tools/rtla/rtla-osnoise.rst
+++ b/Documentation/tools/rtla/rtla-osnoise.rst
@@ -14,7 +14,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_osnoise_description.rst
+.. include:: common_osnoise_description.txt
 
 The *osnoise* tracer outputs information in two ways. It periodically prints
 a summary of the noise of the operating system, including the counters of
@@ -56,4 +56,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 4923a362129b..f56fe546411b 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -16,7 +16,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_timerlat_description.rst
+.. include:: common_timerlat_description.txt
 
 The **rtla timerlat hist** displays a histogram of each tracer event
 occurrence. This tool uses the periodic information, and the
@@ -25,13 +25,13 @@ occurrence. This tool uses the periodic information, and the
 OPTIONS
 =======
 
-.. include:: common_timerlat_options.rst
+.. include:: common_timerlat_options.txt
 
-.. include:: common_hist_options.rst
+.. include:: common_hist_options.txt
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
-.. include:: common_timerlat_aa.rst
+.. include:: common_timerlat_aa.txt
 
 EXAMPLE
 =======
@@ -110,4 +110,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 50968cdd2095..7dbe625d0c42 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -16,7 +16,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_timerlat_description.rst
+.. include:: common_timerlat_description.txt
 
 The **rtla timerlat top** displays a summary of the periodic output
 from the *timerlat* tracer. It also provides information for each
@@ -26,13 +26,13 @@ seem with the option **-T**.
 OPTIONS
 =======
 
-.. include:: common_timerlat_options.rst
+.. include:: common_timerlat_options.txt
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
-.. include:: common_options.rst
+.. include:: common_options.txt
 
-.. include:: common_timerlat_aa.rst
+.. include:: common_timerlat_aa.txt
 
 **--aa-only** *us*
 
@@ -133,4 +133,4 @@ AUTHOR
 ------
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat.rst b/Documentation/tools/rtla/rtla-timerlat.rst
index 20e2d259467f..ce9f57e038c3 100644
--- a/Documentation/tools/rtla/rtla-timerlat.rst
+++ b/Documentation/tools/rtla/rtla-timerlat.rst
@@ -14,7 +14,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_timerlat_description.rst
+.. include:: common_timerlat_description.txt
 
 The **rtla timerlat top** mode displays a summary of the periodic output
 from the *timerlat* tracer. The **rtla timerlat hist** mode displays
@@ -51,4 +51,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla.rst b/Documentation/tools/rtla/rtla.rst
index fc0d233efcd5..2a5fb7004ad4 100644
--- a/Documentation/tools/rtla/rtla.rst
+++ b/Documentation/tools/rtla/rtla.rst
@@ -45,4 +45,4 @@ AUTHOR
 ======
 Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
-- 
2.43.0


