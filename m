Return-Path: <linux-doc+bounces-6413-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8708287C1
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 15:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDF59B227FC
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 14:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41DD39864;
	Tue,  9 Jan 2024 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Uj2ZY9TA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717436B0D
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5573c79aac5so604959a12.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 06:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1704809364; x=1705414164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfBxqDS9hHlXmsmRF9XL3tSKxrM0B3suizklfFVNCPU=;
        b=Uj2ZY9TA6GFg1CkGdvuthSLcaB+62PRymZtizDPe2vATZmurnhpryKzjHbioMIE0g8
         vHEGXmxGnELPKrKMyKZacIX0u0sXa/efvWLwKcLNTLOjgCz2eqz6/LanHPL21jIlGg/o
         W9Ao7AvREwIkEDeZOMEn0RRf58zKU6bcw3xO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704809364; x=1705414164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfBxqDS9hHlXmsmRF9XL3tSKxrM0B3suizklfFVNCPU=;
        b=YFMMQ5lakoFsD86yns7Zoh1g2AzLUq0HOaemw22i0q4BPp5yQMUQex+i/JmCGk1XTl
         tkA7wuOkiagHOPlO6HIsKRSHFEllcpJqQAWvNXfo6Gx4+x6Z+Qw2Jxxmb4wDG0oz8le6
         sLTV6CICY00uv5xYxxyPgXuz8xvRCD1Yugs9qX13LQxeYaYxSCJe6Mki6p9jfzfuxhOc
         J8U36VIJBDruJLEhHoG4lDev/UKDGLmu7kJJW4bwCaOppd8LVLP7r+wear99+COd4jTj
         KlVCqyrqf4/CRe30JDB7wou5qWE8dSWt6DfcNGSPPrRXvJZpRQwxTDNvgC83oL52H7WR
         moQA==
X-Gm-Message-State: AOJu0YygJxtqiZ+eKds7F86VkxQ925A5AvoCyMxwR8fvBODAlWuZdB/E
	gKSnU9jsHc8vbK/bZEG5awj3Uq17I2ns7Q==
X-Google-Smtp-Source: AGHT+IFy0E+eIQjrX/iymTN4VUkB9dTkTMY4EJTa9tSrFbeWJr42iW8bPR9nUN+pr7lUJKLaWkgU2Q==
X-Received: by 2002:a50:cdc5:0:b0:557:4249:44 with SMTP id h5-20020a50cdc5000000b0055742490044mr6444656edj.1.1704809363734;
        Tue, 09 Jan 2024 06:09:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id el10-20020a056402360a00b00557f54cceb6sm907262edb.4.2024.01.09.06.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 06:09:23 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] kernel-doc: document object-like preprocessor macros
Date: Tue,  9 Jan 2024 15:03:45 +0100
Message-ID: <20240109140345.3344094-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I had no idea this exists, but Randy pointed out it's been added quite
a long time ago in cbb4d3e6510b ("scripts/kernel-doc: handle
object-like macros"). Definitely way before I started to write all the
drm docs sadly, so there's a few things where I skipped writing
kernel-doc since I didn't know it was possible.

Fix this asap by documenting the two possible kernel-doc flavours for
preprocessor definitions.

References: https://lore.kernel.org/dri-devel/dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org/
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/doc-guide/kernel-doc.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 6ad72ac6861b..a966f1fd5c30 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -341,6 +341,32 @@ Typedefs with function prototypes can also be documented::
    */
    typedef void (*type_name)(struct v4l2_ctrl *arg1, void *arg2);
 
+Preprocessor defines documentation
+----------------------------------
+
+There are two ways to document preprocessor defines. The first works more or
+less like kernel-doc for functions, including parameters::
+
+  /**
+   * FUNC_NAME() - Brief description
+   * @arg1: description of arg1
+   * @arg2: description of arg2
+   *
+   * Description of the preprocessor function, may have multiple paragraphs.
+   */
+  #define FUNC_NAME(arg1, arg2)
+
+The second type is different and for object-like preprocessor macros without any
+parameters::
+
+  /**
+   * define MACRO - Brief description
+   *
+   * Description of the object-like preprocessor macro, may have multiple
+   * paragraphs.
+   */
+   #define MACRO
+
 Highlights and cross-references
 -------------------------------
 
-- 
2.43.0


