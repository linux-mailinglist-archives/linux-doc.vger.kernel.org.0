Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C661623F1AB
	for <lists+linux-doc@lfdr.de>; Fri,  7 Aug 2020 19:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgHGRHd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Aug 2020 13:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgHGRH2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 13:07:28 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98940C061757
        for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2020 10:07:28 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id b25so1802191qto.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2020 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=73CJ7K3BBVqbmef9NiZ9ufV2B5Bze4yzYWkt/Hzaq0s=;
        b=Wllvkc9Ag1Gus5yO6GFcYjGFVFZid9L4//cUwR+xo5geiYYVvEkaNzK2kOZOVjpr2c
         TccGHxR/M5+N2HfQv4FkOo7wXKkzNGzKv1uZRzonPEGHecIHX4Kv5PonWf/WyuTCC/8U
         07KY4lu7QRWw4suyqZDuOPUUe2LYekwR+ccaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=73CJ7K3BBVqbmef9NiZ9ufV2B5Bze4yzYWkt/Hzaq0s=;
        b=QHwHaAC86Aa4OlcRmb1+/3dhIDW6f3fM89gVn2wxCCLssEbbEDAbSJiP+/E2WcJ6Il
         T6uJfZbc/NhQliyW171YBnplk8d+PVFUvGumO+Syxy02q44yGUYcGtE7zP+XDdVTLjkG
         SMac1yw+kyhTPpRIfgfWYKl4fow+ec/kvc3DgdI9yEKIXhJrpaLFspqCJGOKJ5Ee3P3L
         490h+UpF10SCtNM9DhMDmRwT+x4iSNkBpXmGEPG5gcMhOiCGxWBrBA9SXZ/RSelupEi0
         Jv0/ClgKbo7lWstfJ7iBZSaDT7yzT0yBS+sMIIuFAGe3hCHTcmGHzhS9KrVtBE84ZqcC
         Mj/A==
X-Gm-Message-State: AOAM533WGBcNV9frWrfF41u8DkJ190GUTqp/wmKaaK+shAGXAc8OvSB5
        bUVMTqZ/ZXUOZLAHDuGrecmMGg==
X-Google-Smtp-Source: ABdhPJzSmMuQOJcTfh/pB39E/D/Q7wp06QxNzN+1Wh3mzUrHUaWATqaVtbb1/bK7YIFwrMVsk7gq7A==
X-Received: by 2002:ac8:520f:: with SMTP id r15mr15580616qtn.116.1596820047786;
        Fri, 07 Aug 2020 10:07:27 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:cad3:ffff:feb3:bd59])
        by smtp.gmail.com with ESMTPSA id w18sm8559905qtk.1.2020.08.07.10.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 10:07:27 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        neeraju@codeaurora.org, "Paul E. McKenney" <paulmck@kernel.org>,
        peterz@infradead.org, Randy Dunlap <rdunlap@infradead.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        tglx@linutronix.de, vineethrp@gmail.com
Subject: [PATCH v4 0/5] option-subject: RCU and CPU hotplug checks and docs
Date:   Fri,  7 Aug 2020 13:07:17 -0400
Message-Id: <20200807170722.2897328-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


This series improves/adds to RCU's warnings about CPU hotplug and adds
documentation and testing.

v3->v4: Minor cleanups.

Joel Fernandes (Google) (5):
rcu/tree: Add a warning if CPU being onlined did not report QS already
rcu/tree: Clarify comments about FQS loop reporting quiescent states
rcu/tree: Make FQS complaining about offline CPU more aggressive
rcutorture: Force synchronizing of RCU flavor from hotplug notifier
docs: Update RCU's hotplug requirements with a bit about design

.../RCU/Design/Requirements/Requirements.rst  | 22 +++++
kernel/rcu/rcutorture.c                       | 81 ++++++++++---------
kernel/rcu/tree.c                             | 39 +++++++--
3 files changed, 95 insertions(+), 47 deletions(-)

--
2.28.0.236.gb10cc79966-goog

