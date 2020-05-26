Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744091D595B
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2020 20:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgEOSo4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 May 2020 14:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgEOSop (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 May 2020 14:44:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819A4C05BD09
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 11:44:44 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t11so1400946pgg.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZrZZlEq92Pse6AsQBZ3gt5RG0ZPIDCja3ntEc/+5UQ=;
        b=OF8azeut5MIuxlonteG99mx9a8Av6BpOuIl5byPuyYv0PuO0UXM/SByDvX2ewPXsPg
         /og5vzn72KRD56TgC3VrKeifwDs395skcMWCdtpGQCKKj5PJMqovDHzFGlQ73nEVgASR
         oFyOSxGmQZhWbIGuJ7bgbNsyLESS4/HoKrUm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZrZZlEq92Pse6AsQBZ3gt5RG0ZPIDCja3ntEc/+5UQ=;
        b=ujRM3LBch5R1HVR/GPiT6n2CKvzLDSNKIuisQnGDobnp2Ne6740o2spHnJvcpSTbvy
         4a957Kv+Onnu28uYoURhku7WkSqve9LfmqE8SlYukZqEKyW9O9wpcUIoRBhZSDn3JNY2
         4uwSkZ6kL05NwQ7K9FTAZ9PPdOuQ6qV7Ofdv5N7eRQNkiU2Jkq7n/EHDGbeduoiuRGaP
         h0+LKO4CdAYnN8H706PabpU6h/1dMjJoG474Ib9PNey0Q/7vstowFj6CLLB2lyArz/73
         epkClc7Pc+tlWghQ4+PYQN1DY7QOG4Ouk08g5BLF1yU+d4jQxxiJsMQ5S2Nx9bmZRQ7J
         bGUg==
X-Gm-Message-State: AOAM530qDXRBIHjw3U7k81wM7S1bTurTXykSAEFCBVYSkFX7l4OOr2Ke
        enWDH5Bfmy5PY11jbVdmLWKqqKgZEoE=
X-Google-Smtp-Source: ABdhPJy0Km/ifgMEiePh3m/4wFYQO+7PiRxrK/I+HUaIW+MrdLPTJ2yAIsLPOcL7MweyQmOZrjJPtQ==
X-Received: by 2002:a62:2544:: with SMTP id l65mr5284782pfl.288.1589568284068;
        Fri, 15 May 2020 11:44:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a2sm2509003pfl.28.2020.05.15.11.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 11:44:43 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 6/6] ramoops: Add max_reason optional field to ramoops DT node
Date:   Fri, 15 May 2020 11:44:34 -0700
Message-Id: <20200515184434.8470-7-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
References: <20200515184434.8470-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Pavel Tatashin <pasha.tatashin@soleen.com>

Currently, it is possible to dump kmsges for panic, or oops.
With max_reason it is possible to dump messages for other
kmesg_dump events, for example reboot, halt, shutdown, kexec.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Link: https://lore.kernel.org/lkml/20200506211523.15077-6-keescook@chromium.org/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 .../devicetree/bindings/reserved-memory/ramoops.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
index 0eba562fe5c6..b7886fea368c 100644
--- a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
@@ -30,7 +30,7 @@ Optional properties:
 - ecc-size: enables ECC support and specifies ECC buffer size in bytes
   (defaults to 0: no ECC)
 
-- record-size: maximum size in bytes of each dump done on oops/panic
+- record-size: maximum size in bytes of each kmsg dump.
   (defaults to 0: disabled)
 
 - console-size: size in bytes of log buffer reserved for kernel messages
@@ -45,7 +45,16 @@ Optional properties:
 - unbuffered: if present, use unbuffered mappings to map the reserved region
   (defaults to buffered mappings)
 
-- no-dump-oops: if present, only dump panics (defaults to panics and oops)
+- max-reason: if present, sets maximum type of kmsg dump reasons to store
+  (defaults to 2: log Oopses and Panics). This can be set to INT_MAX to
+  store all kmsg dumps. See include/linux/kmsg_dump.h KMSG_DUMP_* for other
+  kmsg dump reason values. Setting this to 0 (KMSG_DUMP_UNDEF), means the
+  reason filtering will be controlled by the printk.always_kmsg_dump boot
+  param: if unset, it will be KMSG_DUMP_OOPS, otherwise KMSG_DUMP_MAX.
+
+- no-dump-oops: deprecated, use max_reason instead. If present, and
+  max_reason is not specified, it is equivalent to max_reason = 1
+  (KMSG_DUMP_PANIC).
 
 - flags: if present, pass ramoops behavioral flags (defaults to 0,
   see include/linux/pstore_ram.h RAMOOPS_FLAG_* for flag values).
-- 
2.20.1

