Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C20A6832B8
	for <lists+linux-doc@lfdr.de>; Tue, 31 Jan 2023 17:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjAaQbf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Jan 2023 11:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjAaQbC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 11:31:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653675926D;
        Tue, 31 Jan 2023 08:30:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 007A9615A2;
        Tue, 31 Jan 2023 16:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECC7C4339C;
        Tue, 31 Jan 2023 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675182628;
        bh=ZgIoUs7+A3ueUtB3FmNtkEb+5gmupjAUt6kXZtRB6Jc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cAzEV/9ZS1hzyrm9u6f4M8qpJMJEZCI80q8ObtQ5F+2wiIGG00tpmWPbZiroFm46I
         o1nz1+PUBWiZgCu3pM7FckNlfBSCNEACgSKozQzSIsvbujuEZRBwx8cz+E4OGJtu2V
         J5s4BmAsIpz/sN5p2qxN70XthKVZ61V8BXJIW1UoeER7frSyo3If7IpTi6IoeKL2JR
         1OM/Z89PUbPlKJN6wEssQnvDTgUqFC4oPLPiJQJOCzwa4AaMKRRZQDd67ZRQYkakjt
         hUDx7xkP0EDSvNlszharjQ3h0VTNLlDCfMBJUJRlMXwgE9TGJHUZFYxd0W7NdTRgF4
         ePMH037RwZ15A==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        linux-trace-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 6/6] Documentation/rtla: Add hwnoise man page
Date:   Tue, 31 Jan 2023 17:30:07 +0100
Message-Id: <0e9d6b25a88b23bfea11e0cb9b95b5b0845b670b.1675181734.git.bristot@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1675181734.git.bristot@kernel.org>
References: <cover.1675181734.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a man page for the new rtla hwnoise tool, mostly based in the
rtla osnoise top.

Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/tools/rtla/index.rst        |   1 +
 Documentation/tools/rtla/rtla-hwnoise.rst | 107 ++++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/tools/rtla/rtla-hwnoise.rst

diff --git a/Documentation/tools/rtla/index.rst b/Documentation/tools/rtla/index.rst
index 840f0bf3e803..05d2652e4072 100644
--- a/Documentation/tools/rtla/index.rst
+++ b/Documentation/tools/rtla/index.rst
@@ -17,6 +17,7 @@ behavior on specific hardware.
    rtla-timerlat
    rtla-timerlat-hist
    rtla-timerlat-top
+   rtla-hwnoise
 
 .. only::  subproject and html
 
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
new file mode 100644
index 000000000000..fb1c52bbc00b
--- /dev/null
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -0,0 +1,107 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+rtla-hwnoise
+============
+------------------------------------------
+Detect and quantify hardware-related noise
+------------------------------------------
+
+:Manual section: 1
+
+SYNOPSIS
+========
+
+**rtla hwnoise** [*OPTIONS*]
+
+DESCRIPTION
+===========
+
+**rtla hwnoise** collects the periodic summary from the *osnoise* tracer
+running with *interrupts disabled*. By disabling interrupts, and the scheduling
+of threads as a consequence, only non-maskable interrupts and hardware-related
+noise is allowed.
+
+The tool also allows the configurations of the *osnoise* tracer and the
+collection of the tracer output.
+
+OPTIONS
+=======
+.. include:: common_osnoise_options.rst
+
+.. include:: common_top_options.rst
+
+.. include:: common_options.rst
+
+EXAMPLE
+=======
+In the example below, the **rtla hwnoise** tool is set to run on CPUs *1-7*
+on a system with 8 cores/16 threads with hyper-threading enabled.
+
+The tool is set to detect any noise higher than *one microsecond*,
+to run for *ten minutes*, displaying a summary of the report at the
+end of the session::
+
+  # rtla hwnoise -c 1-7 -T 1 -d 10m -q
+                                          Hardware-related Noise
+  duration:   0 00:10:00 | time is in us
+  CPU Period       Runtime        Noise  % CPU Aval   Max Noise   Max Single          HW          NMI
+    1 #599       599000000          138    99.99997           3            3           4           74
+    2 #599       599000000           85    99.99998           3            3           4           75
+    3 #599       599000000           86    99.99998           4            3           6           75
+    4 #599       599000000           81    99.99998           4            4           2           75
+    5 #599       599000000           85    99.99998           2            2           2           75
+    6 #599       599000000           76    99.99998           2            2           0           75
+    7 #599       599000000           77    99.99998           3            3           0           75
+
+
+The first column shows the *CPU*, and the second column shows how many
+*Periods* the tool ran during the session. The *Runtime* is the time
+the tool effectively runs on the CPU. The *Noise* column is the sum of
+all noise that the tool observed, and the *% CPU Aval* is the relation
+between the *Runtime* and *Noise*.
+
+The *Max Noise* column is the maximum hardware noise the tool detected in a
+single period, and the *Max Single* is the maximum single noise seen.
+
+The *HW* and *NMI* columns show the total number of *hardware* and *NMI* noise
+occurrence observed by the tool.
+
+For example, *CPU 3* ran *599* periods of *1 second Runtime*. The CPU received
+*86 us* of noise during the entire execution, leaving *99.99997 %* of CPU time
+for the application. In the worst single period, the CPU caused *4 us* of
+noise to the application, but it was certainly caused by more than one single
+noise, as the *Max Single* noise was of *3 us*. The CPU has *HW noise,* at a
+rate of *six occurrences*/*ten minutes*. The CPU also has *NMIs*, at a higher
+frequency: around *seven per second*.
+
+The tool should report *0* hardware-related noise in the ideal situation.
+For example, by disabling hyper-threading to remove the hardware noise,
+and disabling the TSC watchdog to remove the NMI (it is possible to identify
+this using tracing options of **rtla hwnoise**), it was possible to reach
+the ideal situation in the same hardware::
+
+  # rtla hwnoise -c 1-7 -T 1 -d 10m -q
+                                          Hardware-related Noise
+  duration:   0 00:10:00 | time is in us
+  CPU Period       Runtime        Noise  % CPU Aval   Max Noise   Max Single          HW          NMI
+    1 #599       599000000            0   100.00000           0            0           0            0
+    2 #599       599000000            0   100.00000           0            0           0            0
+    3 #599       599000000            0   100.00000           0            0           0            0
+    4 #599       599000000            0   100.00000           0            0           0            0
+    5 #599       599000000            0   100.00000           0            0           0            0
+    6 #599       599000000            0   100.00000           0            0           0            0
+    7 #599       599000000            0   100.00000           0            0           0            0
+
+SEE ALSO
+========
+
+**rtla-osnoise**\(1)
+
+Osnoise tracer documentation: <https://www.kernel.org/doc/html/latest/trace/osnoise-tracer.html>
+
+AUTHOR
+======
+Written by Daniel Bristot de Oliveira <bristot@kernel.org>
+
+.. include:: common_appendix.rst
-- 
2.38.1

