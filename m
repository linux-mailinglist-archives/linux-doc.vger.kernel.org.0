Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8B4C252E8
	for <lists+linux-doc@lfdr.de>; Tue, 21 May 2019 16:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbfEUOw0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 May 2019 10:52:26 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41340 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728539AbfEUOwU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 May 2019 10:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558450338; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+B18APaxvHsp3HPUtJiRP9lFp/hR6r7x1rtqKumiKiM=;
        b=ax+OwyfLOM8ZdjPX8gVfeoD39JKJTqcBvVDrGbazKu4KRC9R4nw3xojBtGuHLjHwmroqIZ
        5VIYrXslA78URBExlzuhtFfFhdS/4o597z7shkq2jTb4kw1hqq5L4Q6mVm56e/02Vq7et4
        1DTREOThqlN5sNdA2Z3DNCdByblCMBY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v12 13/13] MIPS: jz4740: Drop obsolete code
Date:   Tue, 21 May 2019 16:51:41 +0200
Message-Id: <20190521145141.9813-14-paul@crapouillou.net>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The old clocksource/timer platform code is now obsoleted by the newly
introduced TCU drivers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v5: New patch
    
    v6-v11: No change
    
    v12: Only remove clocksource code. The rest will eventually be
    	 removed in a future patchset when the PWM/watchdog drivers
    	 are updated.

 arch/mips/jz4740/time.c | 154 +---------------------------------------
 1 file changed, 2 insertions(+), 152 deletions(-)

diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
index 2ca9160f642a..9a61bca8e9f0 100644
--- a/arch/mips/jz4740/time.c
+++ b/arch/mips/jz4740/time.c
@@ -13,164 +13,14 @@
  *
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/time.h>
+#include <linux/clocksource.h>
 
-#include <linux/clockchips.h>
-#include <linux/sched_clock.h>
-
-#include <asm/mach-jz4740/clock.h>
-#include <asm/mach-jz4740/irq.h>
 #include <asm/mach-jz4740/timer.h>
-#include <asm/time.h>
-
-#include "clock.h"
-
-#define TIMER_CLOCKEVENT 0
-#define TIMER_CLOCKSOURCE 1
-
-static uint16_t jz4740_jiffies_per_tick;
-
-static u64 jz4740_clocksource_read(struct clocksource *cs)
-{
-	return jz4740_timer_get_count(TIMER_CLOCKSOURCE);
-}
-
-static struct clocksource jz4740_clocksource = {
-	.name = "jz4740-timer",
-	.rating = 200,
-	.read = jz4740_clocksource_read,
-	.mask = CLOCKSOURCE_MASK(16),
-	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
-};
-
-static u64 notrace jz4740_read_sched_clock(void)
-{
-	return jz4740_timer_get_count(TIMER_CLOCKSOURCE);
-}
-
-static irqreturn_t jz4740_clockevent_irq(int irq, void *devid)
-{
-	struct clock_event_device *cd = devid;
-
-	jz4740_timer_ack_full(TIMER_CLOCKEVENT);
-
-	if (!clockevent_state_periodic(cd))
-		jz4740_timer_disable(TIMER_CLOCKEVENT);
-
-	cd->event_handler(cd);
-
-	return IRQ_HANDLED;
-}
-
-static int jz4740_clockevent_set_periodic(struct clock_event_device *evt)
-{
-	jz4740_timer_set_count(TIMER_CLOCKEVENT, 0);
-	jz4740_timer_set_period(TIMER_CLOCKEVENT, jz4740_jiffies_per_tick);
-	jz4740_timer_irq_full_enable(TIMER_CLOCKEVENT);
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static int jz4740_clockevent_resume(struct clock_event_device *evt)
-{
-	jz4740_timer_irq_full_enable(TIMER_CLOCKEVENT);
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static int jz4740_clockevent_shutdown(struct clock_event_device *evt)
-{
-	jz4740_timer_disable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static int jz4740_clockevent_set_next(unsigned long evt,
-	struct clock_event_device *cd)
-{
-	jz4740_timer_set_count(TIMER_CLOCKEVENT, 0);
-	jz4740_timer_set_period(TIMER_CLOCKEVENT, evt);
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static struct clock_event_device jz4740_clockevent = {
-	.name = "jz4740-timer",
-	.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
-	.set_next_event = jz4740_clockevent_set_next,
-	.set_state_shutdown = jz4740_clockevent_shutdown,
-	.set_state_periodic = jz4740_clockevent_set_periodic,
-	.set_state_oneshot = jz4740_clockevent_shutdown,
-	.tick_resume = jz4740_clockevent_resume,
-	.rating = 200,
-#ifdef CONFIG_MACH_JZ4740
-	.irq = JZ4740_IRQ_TCU0,
-#endif
-#if defined(CONFIG_MACH_JZ4770) || defined(CONFIG_MACH_JZ4780)
-	.irq = JZ4780_IRQ_TCU2,
-#endif
-};
-
-static struct irqaction timer_irqaction = {
-	.handler	= jz4740_clockevent_irq,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "jz4740-timerirq",
-	.dev_id		= &jz4740_clockevent,
-};
 
 void __init plat_time_init(void)
 {
-	int ret;
-	uint32_t clk_rate;
-	uint16_t ctrl;
-	struct clk *ext_clk;
-
 	of_clk_init(NULL);
 	jz4740_timer_init();
-
-	ext_clk = clk_get(NULL, "ext");
-	if (IS_ERR(ext_clk))
-		panic("unable to get ext clock");
-	clk_rate = clk_get_rate(ext_clk) >> 4;
-	clk_put(ext_clk);
-
-	jz4740_jiffies_per_tick = DIV_ROUND_CLOSEST(clk_rate, HZ);
-
-	clockevent_set_clock(&jz4740_clockevent, clk_rate);
-	jz4740_clockevent.min_delta_ns = clockevent_delta2ns(100, &jz4740_clockevent);
-	jz4740_clockevent.min_delta_ticks = 100;
-	jz4740_clockevent.max_delta_ns = clockevent_delta2ns(0xffff, &jz4740_clockevent);
-	jz4740_clockevent.max_delta_ticks = 0xffff;
-	jz4740_clockevent.cpumask = cpumask_of(0);
-
-	clockevents_register_device(&jz4740_clockevent);
-
-	ret = clocksource_register_hz(&jz4740_clocksource, clk_rate);
-
-	if (ret)
-		printk(KERN_ERR "Failed to register clocksource: %d\n", ret);
-
-	sched_clock_register(jz4740_read_sched_clock, 16, clk_rate);
-
-	setup_irq(jz4740_clockevent.irq, &timer_irqaction);
-
-	ctrl = JZ_TIMER_CTRL_PRESCALE_16 | JZ_TIMER_CTRL_SRC_EXT;
-
-	jz4740_timer_set_ctrl(TIMER_CLOCKEVENT, ctrl);
-	jz4740_timer_set_ctrl(TIMER_CLOCKSOURCE, ctrl);
-
-	jz4740_timer_set_period(TIMER_CLOCKEVENT, jz4740_jiffies_per_tick);
-	jz4740_timer_irq_full_enable(TIMER_CLOCKEVENT);
-
-	jz4740_timer_set_period(TIMER_CLOCKSOURCE, 0xffff);
-
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-	jz4740_timer_enable(TIMER_CLOCKSOURCE);
+	timer_probe();
 }
-- 
2.21.0.593.g511ec345e18

