Return-Path: <linux-doc+bounces-267-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D28DE7C90DC
	for <lists+linux-doc@lfdr.de>; Sat, 14 Oct 2023 00:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C068282EAB
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 22:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE652C847;
	Fri, 13 Oct 2023 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jji74C+V"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850122C84B
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 22:49:29 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FCC710EA;
	Fri, 13 Oct 2023 15:49:00 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3513b5a9e8eso9842285ab.0;
        Fri, 13 Oct 2023 15:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697237337; x=1697842137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOnBISCPbs+GXr5xHkNIZiy97l93WP5W3+/uL75zbGY=;
        b=jji74C+VL0qwieAScv1vXq0meaUAeP+U6TSz8w3zOx/X18rm6YH2to8A/ADQYdfmF1
         TGD0PplQROAbu98FbNF6LOeYtosUuMfyRO/v0lWwqtsTJGwpwgUPm7YpKEljbwtowrty
         +3ay7E1VyRqyi9Y1AXXcrjyaCXTa9p6da/IWMeblMtVKZE+VzaDUPPXxW6WxpBRkkVGe
         gQrmLk+8pcT8xANfRD6+fTk1Ayhry3jCgBQywD9koRYwvWS10/RDgrgJfAMOG776ffo9
         t7DOSVwS+Wk3fSJewKFQyCjSadBulAXmWP2klcKCAW0YxMoVnzu5rNGLinU5zwNO1fpu
         qsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697237337; x=1697842137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOnBISCPbs+GXr5xHkNIZiy97l93WP5W3+/uL75zbGY=;
        b=IjJbjXPZtd6flzMPIXueKmdiuKY2kVHVbG22bbZqu/+H9bmo1HH81G8KLKiLwluI7l
         COF8cB2jbPOAnkd2vXLpfcaJ8x0I/aCzf9AJHY9vw+B73c49eypcdwi/fjnvUvjqqYb0
         CnwGZtGU2zTNf5kFOsgCiLqptvTWgoLIVFs1MtXCWtvUw+eu1J6wbaYZWK2+po1AANWA
         3BQqXF+HiqY8IIL2TgGnALZkZKsDgQetyjXlyRadoegwxCM3BKoKXdfqeDV72NP4acak
         cG/ezOVz/0DaOIxyvtVWMUJAdq+BHt824Kh/si0wgVx5UyuH7SAcwqbZJ7hhxPZWVvgD
         4shg==
X-Gm-Message-State: AOJu0Yx0N5uP0V7lnNuXdYA/o0oGAlPhH2GAK5406ClPYzzC78NjAKzc
	zNIoldKYr60olAwWtSff/Co7vxyuXtdP6w==
X-Google-Smtp-Source: AGHT+IFMnfzPDgT3d0GKACRRcR9UzR1ArRvamspsNH0Ln2meLL20prnc/eNH1S5zKvpzmkuzx2aXNw==
X-Received: by 2002:a05:6e02:1a41:b0:357:4621:10eb with SMTP id u1-20020a056e021a4100b00357462110ebmr12755180ilv.4.1697237336878;
        Fri, 13 Oct 2023 15:48:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 15:48:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: lb@semihalf.com,
	linux@rasmusvillemoes.dk,
	joe@perches.com,
	mcgrof@kernel.org,
	daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7b 22/25] dyndbg: change WARN_ON to WARN_ON_ONCE
Date: Fri, 13 Oct 2023 16:48:14 -0600
Message-ID: <20231013224818.3456409-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This shouldn't ever happen, and 1st 2 conditions never have.

The 3rd condition did happen, due to corrupt linkage due to a missing
align(8) in DYNDBG_CLASSMAP_USE, on the static struct allocation into
the __dyndbg_class_users section.

Not sure whether changing to _ONCE is appropriate - this is a
module-load activity, so it won't continuously spam syslog.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
undo BUG_ON addition
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5825b58043a6..2a5eb64dbc27 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1284,7 +1284,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 */
 	for_each_boxed_vector(di, class_users, num_class_users, i, cli) {
 
-		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
+		if (WARN_ON_ONCE(!cli || !cli->map || !cli->user_mod_name))
 			continue;
 
 		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
-- 
2.41.0


