Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1C23A0498
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 21:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhFHTpC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 15:45:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:49522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238414AbhFHTod (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Jun 2021 15:44:33 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CE70611BD;
        Tue,  8 Jun 2021 19:42:39 +0000 (UTC)
Date:   Tue, 8 Jun 2021 15:42:37 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 8/9] tracing: Add osnoise tracer
Message-ID: <20210608154237.4e78eca5@oasis.local.home>
In-Reply-To: <0db868d6-2f16-d59e-0eb2-5c55709b4741@redhat.com>
References: <cover.1621024265.git.bristot@redhat.com>
        <bd09a2be9cd0cecee86374dbb49235dd2ef9d750.1621024265.git.bristot@redhat.com>
        <20210604172803.527aa070@oasis.local.home>
        <abf38ca3-3c14-c00a-ff74-f1a75e3ec2e5@redhat.com>
        <20210608133946.52eb7859@oasis.local.home>
        <0db868d6-2f16-d59e-0eb2-5c55709b4741@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 8 Jun 2021 21:33:31 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> cool! I created a function osnoise_taint(char *msg) that prints the msg using
> trace_array_printk_buf. I am using it instead of all pr_warn that could take
> place inside osnoise regular operation.

Make it a macro, so that _THIS_IP_ is meaningful.

> 
> I am still placing the note in the header, just in case we miss the message in
> the log.

+1

-- Steve
