Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729492FDBEF
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 22:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbhATV2R (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Jan 2021 16:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729013AbhATNlQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 08:41:16 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BE0C061795
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:57 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id y4so987327wrt.18
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6OdTPYEA2p5+e67drhVq+n88z8c6ioQj4MZmywIDAFM=;
        b=ANN34zi07ugZKnGspUDX8SGtW0gJFAepbGvNv79YXL+On+puhP5NhSPFqMbN8791sA
         +OpVHWkYimFLQYs5KnQaYv7MjAWS2Ul3AO2PWWUcbpB3s0mDPKyc6jmOhvURhuy9BCME
         7kpqPpCOThFEQ5cUpS3oqyuDFVemFeDY5MopINLGdsmLvFRTquXUbYcHZqti718nZEHP
         VRFHQ/vZK/p00SHoUyQydfK8pTOND8ZEXE7zo4WTonNz09z3ICvSOQgDbHijvLOxpsDi
         r8cyrdeg6PviDgfUSKMZ1IrM0RZq83vxWevQNC5kHDZbU9VsdVIKMqJHihF82i8vSfQi
         agXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6OdTPYEA2p5+e67drhVq+n88z8c6ioQj4MZmywIDAFM=;
        b=IlFTr4fjzcuFakiKS05u7IMC5WK6d9Cg4Bg8XDbTfVOhA6xP7IkjvjrEHTyiIKXjUF
         Tlihkqgbj/hyLNaljgTSXlBoi6VJq+t48PxfW5HjTZu24aMMlm9tyfFrhx8Gt2B7gGsa
         UZeaZmjMB8TaOLuxZXi1V1J3UTbzP2RGQ74O3QF4BbdD/tvhyZ4oGHgX4RaEqREEdGZG
         vPTPW/FeoXbKzP9yU9duOljiRacQiEspsnH8hMg1fq1nYVaZ7x5MpjawJtH4lojtSNQd
         dS0eMeYz7LOZLpZvvK5ZkZGFnD5XXg55IwNkmy1vQkx+ZEsKr8EgOkrhCRNeAKmx+7p8
         2/wA==
X-Gm-Message-State: AOAM532E1MZ7Be8n8AiT+gnJ0VDHCqSZAyNQQ/nafJLZnkExObac5d/L
        HgjW/jWrRxdXoTdp1i8GP5wxaauo5/0xqA==
X-Google-Smtp-Source: ABdhPJz+1pw/frS7iuoskUPl/0VZ5TsAWO9NiEYk8b+eCEfPZfzFbTli1vpPu9KhtHzz75ExuN5A1dfpBffEUg==
Sender: "jackmanb via sendgmr" <jackmanb@beeg.c.googlers.com>
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a1c:81cc:: with SMTP id
 c195mr4398201wmd.70.1611149996346; Wed, 20 Jan 2021 05:39:56 -0800 (PST)
Date:   Wed, 20 Jan 2021 13:39:46 +0000
In-Reply-To: <20210120133946.2107897-1-jackmanb@google.com>
Message-Id: <20210120133946.2107897-3-jackmanb@google.com>
Mime-Version: 1.0
References: <20210120133946.2107897-1-jackmanb@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH bpf-next v3 2/2] docs: bpf: Clarify -mcpu=v3 requirement for
 atomic ops
From:   Brendan Jackman <jackmanb@google.com>
To:     bpf@vger.kernel.org
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Florent Revest <revest@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexei pointed out [1] that this wording is pretty confusing. Here's
an attempt to be more explicit and clear.

[1] https://lore.kernel.org/bpf/CAADnVQJVvwoZsE1K+6qRxzF7+6CvZNzygnoBW9tZNWJELk5c=Q@mail.gmail.com/T/#m07264fc18fdc43af02fc1320968afefcc73d96f4

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/networking/filter.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index 4c2bb4c6364d..b3f457802836 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -1081,9 +1081,10 @@ before is loaded back to ``R0``.
 
 Note that 1 and 2 byte atomic operations are not supported.
 
-Except ``BPF_ADD`` *without* ``BPF_FETCH`` (for legacy reasons), all 4 byte
-atomic operations require alu32 mode. Clang enables this mode by default in
-architecture v3 (``-mcpu=v3``). For older versions it can be enabled with
+Clang can generate atomic instructions by default when ``-mcpu=v3`` is
+enabled. If a lower version for ``-mcpu`` is set, the only atomic instruction
+Clang can generate is ``BPF_ADD`` *without* ``BPF_FETCH``. If you need to enable
+the atomics features, while keeping a lower ``-mcpu`` version, you can use
 ``-Xclang -target-feature -Xclang +alu32``.
 
 You may encounter ``BPF_XADD`` - this is a legacy name for ``BPF_ATOMIC``,
-- 
2.30.0.284.gd98b1dd5eaa7-goog

