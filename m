Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D91179519
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2020 17:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388225AbgCDQ0y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Mar 2020 11:26:54 -0500
Received: from mail-wm1-f74.google.com ([209.85.128.74]:41046 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388312AbgCDQ0x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Mar 2020 11:26:53 -0500
Received: by mail-wm1-f74.google.com with SMTP id f207so1055397wme.6
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2020 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KkLXOOSG3EccFvXnveAsAjlCd4Cuj/e0jkzvyAbgB9g=;
        b=qZMF/8H31N+tU9HXK3934/ePKJPPhUukwvNWbO2CngiFnO2S1pZA5D04fryyHOjcic
         hcn/37cJE8ZiJAlv2eXPofk+HXUOZCp++XlFjjV85KedIeF9bNjDRJGCHSiFmdadFZDp
         BTSItRnZH2VkQwfN7Byv+QQak8Hg6e5SeUFyC5dFzgUUbfK3g81V6GuShW+YVeLOA/Qg
         258s1gSYoGYox8oAsvfLAO7NwEagbmwJml4qVauqIoDbr6miG9fNkB0ld/457wur/5Mv
         uE9AGIVTu6sALEIIiU/8qo4V55KzCD3SOq8w6r/9aVJF+JjhZxNw2UWZO0oTS75RQMDk
         sHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KkLXOOSG3EccFvXnveAsAjlCd4Cuj/e0jkzvyAbgB9g=;
        b=fOOG3m56IUeqJBPlhx3hABsHkMQHp1lpUXOHM2bOjHC+SFqRap61AHCt49T1pnuW93
         TQ5u1IoaWnCJtukL2XykUHfQTVa+erHhNicgkISi5ZI3EUt75ve8J+K0cGpdK1jJHrK0
         niBu+nx50t2kwMrSLQfvDrgey7DMoa/Xiy4tHO/hSRJ75FJqpQQS2IheT3TPfxHm6IpL
         E+okhBbhjd2ijdKTyxXoSb5G7PacZ85ss+DIR4Wxvwt1ddZI9p/cg9qJjK7NUrnFEIV4
         dOWrlY4p3S6xFUJ4/or3Xquoo2Kwl6AjFRw6Xk1r2LjjinuK4kRMnIh7oJUFoS0GsGhq
         pbxw==
X-Gm-Message-State: ANhLgQ1CWoHt0WVxYirQLULGlLTFyAIWq303YFyLDBYu8qdhdiIwQv1U
        6HEWlNwECeFEcbkp8DGllgKfS97evg==
X-Google-Smtp-Source: ADFU+vuwHYHwbkfL0PNKCtBj5UcdevPUZcsHif32DA8cz76eBj0bRnn5n5s9CUCgRlXNld1pzFBAFR97Rg==
X-Received: by 2002:adf:f4c9:: with SMTP id h9mr4909942wrp.168.1583339209473;
 Wed, 04 Mar 2020 08:26:49 -0800 (PST)
Date:   Wed,  4 Mar 2020 17:25:39 +0100
Message-Id: <20200304162541.46663-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH 1/3] kcsan: Fix a typo in a comment
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     paulmck@kernel.org, andreyknvl@google.com, glider@google.com,
        dvyukov@google.com, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Qiujun Huang <hqjagain@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Qiujun Huang <hqjagain@gmail.com>

s/slots slots/slots/

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
[elver: commit message]
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index eb30ecdc8c009..ee8200835b607 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -45,7 +45,7 @@ static DEFINE_PER_CPU(struct kcsan_ctx, kcsan_cpu_ctx) = {
 };
 
 /*
- * Helper macros to index into adjacent slots slots, starting from address slot
+ * Helper macros to index into adjacent slots, starting from address slot
  * itself, followed by the right and left slots.
  *
  * The purpose is 2-fold:
-- 
2.25.0.265.gbab2e86ba0-goog

