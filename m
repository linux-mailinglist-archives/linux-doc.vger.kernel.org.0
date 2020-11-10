Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B58B2AD46E
	for <lists+linux-doc@lfdr.de>; Tue, 10 Nov 2020 12:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgKJLHn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Nov 2020 06:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgKJLHn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 06:07:43 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECFFC0613CF
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 03:07:43 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id h6so9859937pgk.4
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 03:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dxnc/wj2TvGDBxmyx5Nf+xxtQWZ4ImyGwOdGSdt4B2U=;
        b=eTzewguEpa+CGdbUOfXmyzQCrTmpUuGJbRjlbYm85CVMLnUnbQ4bw9Pp22L8ZEMlD3
         gt4Fo6Db47692OZi6grP2eicQfyl1TXeRBCa0UxOSX7FmDOmGvQfdtiG7rHfuQ/9W6Nx
         BQhLqDyNa/Zmyad5BXXGGZN/T932PHp2Yi4y9/yTlTsR4kVxpKXmfrSk8IWCjhcPAGug
         d+ESQJswqC9bsLIoZOqENQrC4kApXFRUT512haWhNFkt26d3RGQ3gorEBxOCCNClH395
         p+ayBJDde87H3jszRWCat+eO71rYbqHJ1BbCoKseEKdu7rgbFzYGiuA2CNEJdIe4v22I
         fJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dxnc/wj2TvGDBxmyx5Nf+xxtQWZ4ImyGwOdGSdt4B2U=;
        b=hR6STSraony6RSvaP+otdoHhT1TxvVhL1EbaaBLMo+DWnUlH1VvZkVG+G3fw6oLvwI
         jWVX6eM796gnN8EnBFN31NAYP7r6ackK1AOdXoQ6Y0atEHvmNkHsAbhNATE2o0kECeyj
         ABI82h80Zutrv2ueoZSUta6Z2legRHhcyAFvo1Q2IkiC+Od+cjUmABWeON6JhXmfP4qL
         dbY8HlOwEnMygdgsyVsrRhxzYxidUXZcbeH/4jz/L+w489z0eTfZp0jUY5kBMYSKUqbc
         NHJsyNIAAdpbKsYn+Pm3Uu0/HNb8ejTE74irDRJttSpVxQruUGluvv7VEK3DQFgmrliG
         V3lg==
X-Gm-Message-State: AOAM530+OdIHH0wPT8iwzvZPGCqC0AHHgDWZhIam+TWGhwRYfoxyDuYv
        WfbRqKZugYaOfcYcBQggPY9ILw==
X-Google-Smtp-Source: ABdhPJzZXVRi0OA3SRAxu13+f8iFR1G3KJDXK02qXXuKDDHpx7t0ifqak6cH99ZQmwKGtkW6fKY5ww==
X-Received: by 2002:a17:90a:d590:: with SMTP id v16mr4517353pju.88.1605006462913;
        Tue, 10 Nov 2020 03:07:42 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id b67sm14296322pfa.151.2020.11.10.03.07.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 03:07:41 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Thomas Renninger <trenn@suse.com>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: stats: Switch to ktime and msec instead of jiffies and usertime
Date:   Tue, 10 Nov 2020 16:37:37 +0530
Message-Id: <0e0fb542b6f6b26944cb2cf356041348aeac95f6.1605006378.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The cpufreq and thermal core, both provide sysfs statistics to help
userspace learn about the behavior of frequencies and cooling states.

This is how they look:

/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:208000 11
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:432000 147
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:729000 1600
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:960000 879
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:1200000 399

/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state0 4097
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state1 8932
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state2 15868
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state3 1384
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state4 103

Here, state0 of thermal corresponds to the highest frequency of the CPU,
i.e. 1200000 and state4 to the lowest one.

While both of these try to show similar kind of data (which can still be
very much different from each other), the values looked different (by a
factor of 10, i.e. thermal's time_in_state is almost 10 times that of
cpufreq time_in_state).

This comes from the fact that cpufreq core displays the time in usertime
units (10 ms).

It would be better if both the frameworks displayed times in the same
unit as the users may need to correlate between them and different
scales just make it awkward. And the choice of thermal core for that
(msec) seems to be a better choice as it is easier to read.

The thermal core also does the stats calculations using ktime, which is
much more accurate as compared to jiffies used by cpufreq core.

This patch updates the cpufreq core to use ktime for the internal
calculations and changes the units of time_in_state to msec.

The results look like this after this commit:

/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:208000 13
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:432000 790
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:729000 12492
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:960000 13259
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:1200000 3830

/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state0 3888
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state1 13432
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state2 12336
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state3 740
/sys/class/thermal/cooling_device0/stats/time_in_state_ms:state4 0

FWIW, tools/power/cpupower/ does consume the time_in_state values from
the sysfs files but it is independent of the unit of the time and didn't
require an update.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/cpu-freq/cpufreq-stats.rst |  5 +--
 drivers/cpufreq/cpufreq_stats.c          | 47 +++++++++++++-----------
 2 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/Documentation/cpu-freq/cpufreq-stats.rst b/Documentation/cpu-freq/cpufreq-stats.rst
index 9ad695b1c7db..9f94012a882f 100644
--- a/Documentation/cpu-freq/cpufreq-stats.rst
+++ b/Documentation/cpu-freq/cpufreq-stats.rst
@@ -64,9 +64,8 @@ need for a reboot.
 
 This gives the amount of time spent in each of the frequencies supported by
 this CPU. The cat output will have "<frequency> <time>" pair in each line, which
-will mean this CPU spent <time> usertime units of time at <frequency>. Output
-will have one line for each of the supported frequencies. usertime units here
-is 10mS (similar to other time exported in /proc).
+will mean this CPU spent <time> msec of time at <frequency>. Output will have
+one line for each of the supported frequencies.
 
 ::
 
diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 6cd5c8ab5d49..e054ada291e7 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -14,35 +14,38 @@
 
 struct cpufreq_stats {
 	unsigned int total_trans;
-	unsigned long long last_time;
+	ktime_t last_time;
 	unsigned int max_state;
 	unsigned int state_num;
 	unsigned int last_index;
-	u64 *time_in_state;
+	ktime_t *time_in_state;
 	unsigned int *freq_table;
 	unsigned int *trans_table;
 
 	/* Deferred reset */
 	unsigned int reset_pending;
-	unsigned long long reset_time;
+	ktime_t reset_time;
 };
 
-static void cpufreq_stats_update(struct cpufreq_stats *stats,
-				 unsigned long long time)
+static void cpufreq_stats_update(struct cpufreq_stats *stats, ktime_t time)
 {
-	unsigned long long cur_time = get_jiffies_64();
+	ktime_t cur_time = ktime_get(), delta;
 
-	stats->time_in_state[stats->last_index] += cur_time - time;
+	delta = ktime_sub(cur_time, time);
+	stats->time_in_state[stats->last_index] =
+		ktime_add(stats->time_in_state[stats->last_index], delta);
 	stats->last_time = cur_time;
 }
 
 static void cpufreq_stats_reset_table(struct cpufreq_stats *stats)
 {
-	unsigned int count = stats->max_state;
+	unsigned int count = stats->max_state, i;
+
+	for (i = 0; i < count; i++)
+		stats->time_in_state[i] = ktime_set(0, 0);
 
-	memset(stats->time_in_state, 0, count * sizeof(u64));
 	memset(stats->trans_table, 0, count * count * sizeof(int));
-	stats->last_time = get_jiffies_64();
+	stats->last_time = ktime_get();
 	stats->total_trans = 0;
 
 	/* Adjust for the time elapsed since reset was requested */
@@ -70,7 +73,7 @@ static ssize_t show_time_in_state(struct cpufreq_policy *policy, char *buf)
 {
 	struct cpufreq_stats *stats = policy->stats;
 	bool pending = READ_ONCE(stats->reset_pending);
-	unsigned long long time;
+	ktime_t time, now = ktime_get(), delta;
 	ssize_t len = 0;
 	int i;
 
@@ -82,18 +85,20 @@ static ssize_t show_time_in_state(struct cpufreq_policy *policy, char *buf)
 				 * before the reset_pending read above.
 				 */
 				smp_rmb();
-				time = get_jiffies_64() - READ_ONCE(stats->reset_time);
+				time = ktime_sub(now, READ_ONCE(stats->reset_time));
 			} else {
-				time = 0;
+				time = ktime_set(0, 0);;
 			}
 		} else {
 			time = stats->time_in_state[i];
-			if (i == stats->last_index)
-				time += get_jiffies_64() - stats->last_time;
+			if (i == stats->last_index) {
+				delta = ktime_sub(now, stats->last_time);
+				time = ktime_add(delta, time);
+			}
 		}
 
 		len += sprintf(buf + len, "%u %llu\n", stats->freq_table[i],
-			       jiffies_64_to_clock_t(time));
+			       ktime_to_ms(time));
 	}
 	return len;
 }
@@ -109,7 +114,7 @@ static ssize_t store_reset(struct cpufreq_policy *policy, const char *buf,
 	 * Defer resetting of stats to cpufreq_stats_record_transition() to
 	 * avoid races.
 	 */
-	WRITE_ONCE(stats->reset_time, get_jiffies_64());
+	WRITE_ONCE(stats->reset_time, ktime_get());
 	/*
 	 * The memory barrier below is to prevent the readers of reset_time from
 	 * seeing a stale or partially updated value.
@@ -228,9 +233,9 @@ void cpufreq_stats_create_table(struct cpufreq_policy *policy)
 	if (!stats)
 		return;
 
-	alloc_size = count * sizeof(int) + count * sizeof(u64);
-
-	alloc_size += count * count * sizeof(int);
+	alloc_size = count * sizeof(*stats->time_in_state);
+	alloc_size += count * sizeof(*stats->freq_table);
+	alloc_size += count * count * sizeof(*stats->trans_table);
 
 	/* Allocate memory for time_in_state/freq_table/trans_table in one go */
 	stats->time_in_state = kzalloc(alloc_size, GFP_KERNEL);
@@ -249,7 +254,7 @@ void cpufreq_stats_create_table(struct cpufreq_policy *policy)
 			stats->freq_table[i++] = pos->frequency;
 
 	stats->state_num = i;
-	stats->last_time = get_jiffies_64();
+	stats->last_time = ktime_get();
 	stats->last_index = freq_table_get_index(stats, policy->cur);
 
 	policy->stats = stats;
-- 
2.25.0.rc1.19.g042ed3e048af

