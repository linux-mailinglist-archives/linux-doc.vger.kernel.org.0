Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD982680F1
	for <lists+linux-doc@lfdr.de>; Sun, 13 Sep 2020 21:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgIMTQG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 13 Sep 2020 15:16:06 -0400
Received: from mail-il1-f207.google.com ([209.85.166.207]:51272 "EHLO
        mail-il1-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgIMTQF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Sep 2020 15:16:05 -0400
Received: by mail-il1-f207.google.com with SMTP id i80so11051454ild.18
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2020 12:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=H5sZMLas0Dftu0/AnBETOMOqnJxRbr4NABj+u/j1kdc=;
        b=BVbyPp38ReklEPKFd2igneryMMt8kZg65zZTkpgZD2IcSQ4Vj1i/QcIsN/EQlIUAs+
         s3WFG++NikEc7q48oQfF1atH9E5Wg1ksiCAXB0cgQHVPQ4X7+BCZIYy32hhw3YLDZoHd
         EsZMsKCa59nxmytbz9MR1P3xxKxbvdMNpSdKOAwf2oY7RHMmWeh5pLM/RrZorVwkeBOs
         e9UZ0kt8cuLmXJyNS2MVRKSttuDp4XtTeAB9Ql3DuewIhLtn+mhVHKmhazGL8zufTVmD
         Dg53+JAidWsijxHq1T0I7Ji4AyPo24Vol88KPanuK5ziIoEiU2yIF1NhXsR/BZ9mA8Mk
         Yh+g==
X-Gm-Message-State: AOAM533JGoRy4uHGQ0CKmhgA4T168uAjK9FRzKrp2i5BzOBtOFWnwqF2
        I08A5d1De7cjjyod9ZBwXuKsnTQjC6lFtjI71c2s35sDXEUY
X-Google-Smtp-Source: ABdhPJyZo8l+cQgc9V5pR/phJ891G3KqtKg+o1CZoUUhUl2oPD+crqlNd1QgYKQl0MErpfK5bx5c4TbXdaZujxA7CqFuCcxtUC1y
MIME-Version: 1.0
X-Received: by 2002:a6b:b7cf:: with SMTP id h198mr8702567iof.55.1600024564229;
 Sun, 13 Sep 2020 12:16:04 -0700 (PDT)
Date:   Sun, 13 Sep 2020 12:16:04 -0700
In-Reply-To: <000000000000a6348d05a9234041@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c86d5f05af36bfac@google.com>
Subject: Re: WARNING in tracepoint_add_func
From:   syzbot <syzbot+721aa903751db87aa244@syzkaller.appspotmail.com>
To:     corbet@lwn.net, davem@davemloft.net, dsahern@gmail.com,
        frederic@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mathieu.desnoyers@polymtl.ca,
        mingo@elte.hu, netdev@vger.kernel.org, peterz@infradead.org,
        rostedt@goodmis.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this issue to:

commit 58956317c8de52009d1a38a721474c24aef74fe7
Author: David Ahern <dsahern@gmail.com>
Date:   Fri Dec 7 20:24:57 2018 +0000

    neighbor: Improve garbage collection

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=146ba853900000
start commit:   746f534a tools/libbpf: Avoid counting local symbols in ABI..
git tree:       bpf
final oops:     https://syzkaller.appspot.com/x/report.txt?x=166ba853900000
console output: https://syzkaller.appspot.com/x/log.txt?x=126ba853900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a0437fdd630bee11
dashboard link: https://syzkaller.appspot.com/bug?extid=721aa903751db87aa244
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=128ff37d900000

Reported-by: syzbot+721aa903751db87aa244@syzkaller.appspotmail.com
Fixes: 58956317c8de ("neighbor: Improve garbage collection")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
