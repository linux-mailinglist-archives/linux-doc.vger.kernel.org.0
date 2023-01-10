Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFBD1664D0A
	for <lists+linux-doc@lfdr.de>; Tue, 10 Jan 2023 21:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbjAJUIi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Jan 2023 15:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjAJUIf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Jan 2023 15:08:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6314BC00;
        Tue, 10 Jan 2023 12:08:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 72CAA61847;
        Tue, 10 Jan 2023 20:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D0EC433D2;
        Tue, 10 Jan 2023 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673381312;
        bh=f7t2Tb6aVa91WI4iN6vlSINZLT/DS+dzcmYkQKr3WX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kNKbsIQ6YZeWN5FzIM2RJojjB2x0a8+x4jTs+VI8fluL3bcI4JYFpmN/tyK9tUNBE
         bKCfbge4hpWsOfBtw1Ft2qLZBWZ0jVLkVi8MlhLxQ7z7lhs4f+7jKdJJzm07D2qEZM
         v/hhAlH/qkXA1fDF3nOc3dsOcgNoAO/9AOusn22YkC+/ZCCmoJkPvbZdZwSpz2/PO8
         ysLysdLkE1xUVAyAHEIvmLpT2Fi1nI95NDkLQ/FHljrsYnl5rpYWAkvNMWSP+wWRLz
         WPLt/OmB0926QNvurOYW+pT1vgQVwTcCWeuwS/BkuDYA30MQ5tdc+/xM1k0dXOOJhK
         ZwPxZ+6ONe6/Q==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        linux-trace-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] rtla/osnoise_top: Pass the params to the usage function
Date:   Tue, 10 Jan 2023 21:08:05 +0100
Message-Id: <d0d58a6eb2901689218bd9877ccec2e145b1fc17.1673380089.git.bristot@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673380089.git.bristot@kernel.org>
References: <cover.1673380089.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation to the hwnoise tool, pass the osnoise top params to the
usage function so it can be adapted according to the mode of the tool.

Also make it static, as it is only used in this file.

Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 tools/tracing/rtla/src/osnoise_top.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/tracing/rtla/src/osnoise_top.c b/tools/tracing/rtla/src/osnoise_top.c
index d7bbd73e1a78..fd2104050e3c 100644
--- a/tools/tracing/rtla/src/osnoise_top.c
+++ b/tools/tracing/rtla/src/osnoise_top.c
@@ -246,7 +246,7 @@ osnoise_print_stats(struct osnoise_top_params *params, struct osnoise_tool *top)
 /*
  * osnoise_top_usage - prints osnoise top usage message
  */
-void osnoise_top_usage(char *usage)
+static void osnoise_top_usage(struct osnoise_top_params *params, char *usage)
 {
 	int i;
 
@@ -350,7 +350,7 @@ struct osnoise_top_params *osnoise_top_parse_args(int argc, char **argv)
 		case 'c':
 			retval = parse_cpu_list(optarg, &params->monitored_cpus);
 			if (retval)
-				osnoise_top_usage("\nInvalid -c cpu list\n");
+				osnoise_top_usage(params, "\nInvalid -c cpu list\n");
 			params->cpus = optarg;
 			break;
 		case 'D':
@@ -359,7 +359,7 @@ struct osnoise_top_params *osnoise_top_parse_args(int argc, char **argv)
 		case 'd':
 			params->duration = parse_seconds_duration(optarg);
 			if (!params->duration)
-				osnoise_top_usage("Invalid -D duration\n");
+				osnoise_top_usage(params, "Invalid -D duration\n");
 			break;
 		case 'e':
 			tevent = trace_event_alloc(optarg);
@@ -375,17 +375,17 @@ struct osnoise_top_params *osnoise_top_parse_args(int argc, char **argv)
 			break;
 		case 'h':
 		case '?':
-			osnoise_top_usage(NULL);
+			osnoise_top_usage(params, NULL);
 			break;
 		case 'p':
 			params->period = get_llong_from_str(optarg);
 			if (params->period > 10000000)
-				osnoise_top_usage("Period longer than 10 s\n");
+				osnoise_top_usage(params, "Period longer than 10 s\n");
 			break;
 		case 'P':
 			retval = parse_prio(optarg, &params->sched_param);
 			if (retval == -1)
-				osnoise_top_usage("Invalid -P priority");
+				osnoise_top_usage(params, "Invalid -P priority");
 			params->set_sched = 1;
 			break;
 		case 'q':
@@ -394,7 +394,7 @@ struct osnoise_top_params *osnoise_top_parse_args(int argc, char **argv)
 		case 'r':
 			params->runtime = get_llong_from_str(optarg);
 			if (params->runtime < 100)
-				osnoise_top_usage("Runtime shorter than 100 us\n");
+				osnoise_top_usage(params, "Runtime shorter than 100 us\n");
 			break;
 		case 's':
 			params->stop_us = get_llong_from_str(optarg);
@@ -420,7 +420,7 @@ struct osnoise_top_params *osnoise_top_parse_args(int argc, char **argv)
 					exit(EXIT_FAILURE);
 				}
 			} else {
-				osnoise_top_usage("--trigger requires a previous -e\n");
+				osnoise_top_usage(params, "--trigger requires a previous -e\n");
 			}
 			break;
 		case '1': /* filter */
@@ -431,11 +431,11 @@ struct osnoise_top_params *osnoise_top_parse_args(int argc, char **argv)
 					exit(EXIT_FAILURE);
 				}
 			} else {
-				osnoise_top_usage("--filter requires a previous -e\n");
+				osnoise_top_usage(params, "--filter requires a previous -e\n");
 			}
 			break;
 		default:
-			osnoise_top_usage("Invalid option");
+			osnoise_top_usage(params, "Invalid option");
 		}
 	}
 
-- 
2.38.1

