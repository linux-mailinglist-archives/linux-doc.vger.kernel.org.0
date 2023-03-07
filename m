Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815536AD417
	for <lists+linux-doc@lfdr.de>; Tue,  7 Mar 2023 02:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCGBgm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Mar 2023 20:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjCGBgl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 20:36:41 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FE33C788;
        Mon,  6 Mar 2023 17:36:39 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id a2so12565809plm.4;
        Mon, 06 Mar 2023 17:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678152999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOYQlgcH4lD1Ha4i8w6bRHjoNTM7YfPZ9WX5HZ9QO3I=;
        b=WaTSDjMCZBclEN8svJcq9Pmi6JcG+tKiz00sPCtEyk7uTzRSZJAJnijU2VlOya9vmP
         FoBiwEd58sL8cAsMjOL0W2CD1dQzqC1LAYHwTXgfJIKBjWwwCjsE9VzmjqxFq0zOES8F
         mMv5hlD7kaK3SOmyej8qjhaGXidp2hwJnFNvunBAjc8McjE75AHz7dsoFHXcf+O3XAbZ
         xirvX8OLJ9ehz0FXt+AHD0jS55AYRminnBrs2CPGAz3as9e5925AVmFvjeow+SdoJ1+4
         jOnYwyolUyItxekQqRECZXxKAbUpKGiOb37g0la+5ORFtKbQCRWUuWxOfB10OEuc0Llm
         tN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678152999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOYQlgcH4lD1Ha4i8w6bRHjoNTM7YfPZ9WX5HZ9QO3I=;
        b=ubpNSxZHBSujlIhtgWdJ0JKUG8kRQKJy5Ahul8v3C8rKHCjt+/zLchcRJcYWmS7Dnp
         tspJocnDOoz8GPOCyx1vQaVQvkX/SVsD2tEJEHZlOPotDB3RyEvVt/akyeZf0sTHdPNR
         pT3EuG4TcAY62cXgGBvWeS+y0oybTth1ZQxUwciC2Jq61Q2XM/gsprJga1Kbgbo9L0eN
         AX7XiyLBqDJwZgQGaAjM9fimz17sxE+acfAWnrmyv7NFbYXiYsJB55HUKh+cLsMh5Ywt
         fXs0L0mf/XSItxYJdeE4nnTTYivonuIOyS4JF4qsiKkR/FSIPVMebSgtvNQ6GACp4uDu
         yuDA==
X-Gm-Message-State: AO0yUKXkl642kD2KsYeCwdyX7ADNTI5ZHxQpsM/MfL7Fsn7ppRgrzh2Q
        T7OpitFTRPBHpjM9ZP20LqlOdjKjsKgcgQ==
X-Google-Smtp-Source: AK7set9TNDTtw5wgGGIsWh6Oli4TjGs+OdUfBpBXy+tm8dWZa7Cute5zIaKXRlix9l0CLbc/IYdq4Q==
X-Received: by 2002:a17:903:11cc:b0:19c:aa09:c455 with SMTP id q12-20020a17090311cc00b0019caa09c455mr15955641plh.25.1678152999128;
        Mon, 06 Mar 2023 17:36:39 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id l19-20020a170902f69300b0019956488546sm7311718plg.277.2023.03.06.17.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 17:36:38 -0800 (PST)
Message-ID: <f94e3ada-212c-eef7-9e7b-03760bb29521@gmail.com>
Date:   Tue, 7 Mar 2023 10:36:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH v2 2/2] media: Adjust column width for pdfdocs
Content-Language: en-US
To:     linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, Akira Yokosawa <akiyks@gmail.com>
References: <29380b3e-1daa-3aef-1749-dbd9960ba620@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <29380b3e-1daa-3aef-1749-dbd9960ba620@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The column width specifiers added in commit 8d0e3fc61abd ("media:
Add 2-10-10-10 RGB formats") don't suffice for column 1 and too
wide for column 2.

Adjust them to get a good looking table.

Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
new to v2

 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index ea545ed1aeaa..d9d7b7621d8c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -778,7 +778,7 @@ number of bits for each component.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{3.2cm}|p{0.8cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 
 .. flat-table:: RGB Formats 10 Bits Per Color Component
-- 
2.25.1


