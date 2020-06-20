Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FCD2020F7
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2020 05:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733116AbgFTDeA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Jun 2020 23:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732791AbgFTDaV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Jun 2020 23:30:21 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46267C0617BB
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2020 20:30:19 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ga6so4998734pjb.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2020 20:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HyXcsVKIRYzWpBmnwJPGbhkvsengpFrT3ttylCxecK0=;
        b=Q7HTsK0JxwrRCE5gTrXMH6V7ktrH1FZWG28aENBbrpLCN5a5y1aJfpu+bsrRkW2sQp
         XhIJBGzuj1m86ch3OFQC2s0hXCylfLeJio9eW92zTzdHrrDStDztJUVyjkmLUN+wvcb0
         z3o/S8+1+G6wnqNAtk+SU1tTedQuZprUxGPmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HyXcsVKIRYzWpBmnwJPGbhkvsengpFrT3ttylCxecK0=;
        b=N7L5HMUM4ntLE778ATyicpNZ8UdkvLvNSjOsjBQaVtx+vx82YtivPDfar6jrmNnyXh
         W824wPSutGIzoUxr55Pan3eJGNfWaYnEKGuVlikwz6p7WgDn5RxXAgeBsW324jF/kAhI
         TRFXDqCbHWrgAhlT03bsM1BFyzKzXxkBw2rC8fBSxZcwoU8uF4BuPKAlXBAeeWPdxP/H
         1p5BeKsCef9IuvEEu8Sh8uUJw+gIG8vpPpAllKy0RjiMm7xkoxDSkWSw4fKMf+5ZFGA8
         Z46rmFegBtjalFx5dusL+UGpfKD0YRytIwI5bYnhU+NdXIofv0fTU+ikBzfV+Enl70UC
         ugAg==
X-Gm-Message-State: AOAM532djFeDwZtI43/OKOK3CGhOzYhw5X4l/FCEnJuzy0+QbKpwG9SV
        GFEcoHwApPLGc/h6WTnau8CG0g==
X-Google-Smtp-Source: ABdhPJxp162ffek9CJ+S9rRNhylZslyYHlf/m2Wtuw5WxNWPTSz41VLYVJnSPeycc1PuPsAzofcIoQ==
X-Received: by 2002:a17:90a:d305:: with SMTP id p5mr6252229pju.44.1592623818774;
        Fri, 19 Jun 2020 20:30:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g9sm7101346pfm.151.2020.06.19.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 20:30:17 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>, x86@kernel.org,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mm@kvack.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2 03/16] drbd: Remove uninitialized_var() usage
Date:   Fri, 19 Jun 2020 20:29:54 -0700
Message-Id: <20200620033007.1444705-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Using uninitialized_var() is dangerous as it papers over real bugs[1]
(or can in the future), and suppresses unrelated compiler warnings (e.g.
"unused variable"). If the compiler thinks it is uninitialized, either
simply initialize the variable or make compiler changes. As a precursor
to removing[2] this[3] macro[4], just initialize this variable to NULL.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: a29728463b25 ("drbd: Backport the "events2" command")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/block/drbd/drbd_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index eeaa3b49b264..0067d328f0b5 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -1604,7 +1604,7 @@ static void broadcast_state_change(struct drbd_state_change *state_change)
 	unsigned int n_device, n_connection, n_peer_device, n_peer_devices;
 	void (*last_func)(struct sk_buff *, unsigned int, void *,
 			  enum drbd_notification_type) = NULL;
-	void *uninitialized_var(last_arg);
+	void *last_arg = NULL;
 
 #define HAS_CHANGED(state) ((state)[OLD] != (state)[NEW])
 #define FINAL_STATE_CHANGE(type) \
-- 
2.25.1

