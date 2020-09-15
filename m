Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A5326AB8E
	for <lists+linux-doc@lfdr.de>; Tue, 15 Sep 2020 20:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgIOSJ6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Sep 2020 14:09:58 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:58239 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbgIOSJQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 14:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1600193356; x=1631729356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=hFApYuTtXawBb/Q1U5pmebyMoxtW2mY4qfAUML9XXzE=;
  b=Oqy7yp9+xQNOx88MKXfHF+3CTjK7kW2k3NGIE4mo6hUtGiq0p7YYHjMs
   kvHChWCgEQvcE3ToRwMjrmJjuMDW29U9nnwwk8QucIxfaCaiz1RsHuGsH
   X9nvs1AnAwg3FBBKLcMD3f57yaFONy6uIUfb51TTzD2mc13Zn5nPdFpFf
   M=;
X-IronPort-AV: E=Sophos;i="5.76,430,1592870400"; 
   d="scan'208";a="54192495"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 15 Sep 2020 18:08:53 +0000
Received: from EX13D31EUA004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS id 6A613A1E4E;
        Tue, 15 Sep 2020 18:08:40 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.85) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Sep 2020 18:08:22 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <elver@google.com>, <fan.du@intel.com>,
        <foersleo@amazon.de>, <gthelen@google.com>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 0/2] DAMON: Improve User Space Interface
Date:   Tue, 15 Sep 2020 20:08:07 +0200
Message-ID: <20200915180807.18812-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915180225.17439-2-sjpark@amazon.com>
References: <20200915180225.17439-2-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.85]
X-ClientProxiedBy: EX13D46UWB004.ant.amazon.com (10.43.161.204) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Seems lore.kernel.org missed original posting of this mail.  Resending.

NOTE: This is only an RFC for future features of DAMON patchset[1], which is
not merged in the mainline yet.  The aim of this RFC is to show how DAMON would
be evolved once it is merged in.  So, if you have some interest in this RFC,
please consider reviewing the DAMON patchset, either.

After posting DAMON patchset[1], we received a number of comments.  Based on
those, we listed and shared future works for DAMON in the kernel summit
2020[2] and had a poll for the priorities of the works.  As a result, the user
space interface improvement received a second highest priority[3].  For the
reason, this patchset is came out.

The 1st patch puts more information in the monitoring thread name so that user
space could charge the DAMON's CPU usage on them by themselves, in fine
granularity.  The 2nd patch makes multiple monitoring contexts available using
the debugfs interface.

[1] https://lore.kernel.org/linux-mm/20200817105137.19296-1-sjpark@amazon.com/
[2] https://linuxplumbersconf.org/event/7/contributions/659/
[3] https://lore.kernel.org/linux-mm/20200831112235.2675-1-sjpark@amazon.com/

Baseline and Complete Git Trees
===============================

The patches are based on the v5.8 plus DAMON v20 patchset[1], RFC v14 of DAMOS
patchset, RFC v8 of physical address space support patchset, and some more
trivial fixes (s/snprintf/scnprintf).  You can also clone the complete git
tree:

    $ git clone git://github.com/sjp38/linux -b damon-usi/rfc/v1

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon-usi/rfc/v1

[1] https://lore.kernel.org/linux-mm/20200817105137.19296-1-sjpark@amazon.com/
[2] https://lore.kernel.org/linux-mm/20200804142430.15384-1-sjpark@amazon.com/
[3] https://lore.kernel.org/linux-mm/20200831104730.28970-1-sjpark@amazon.com/

SeongJae Park (2):
  mm/damon: Put more information in kdamond thread name
  mm/damon/debugfs: Support multiple contexts

 include/linux/damon.h |   2 +
 mm/damon-test.h       |  34 ++--
 mm/damon.c            | 361 +++++++++++++++++++++++++++++++++---------
 3 files changed, 308 insertions(+), 89 deletions(-)

-- 
2.17.1

