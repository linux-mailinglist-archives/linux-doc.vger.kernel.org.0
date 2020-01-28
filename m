Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D26B14B371
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jan 2020 12:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgA1LUc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Jan 2020 06:20:32 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:47055 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgA1LUc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 06:20:32 -0500
Received: by mail-qk1-f194.google.com with SMTP id g195so12878394qke.13
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2020 03:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=ydbYF0D7QAu7P1+NQVQLTUDzbcrzMyEp6Q2vaSMl/rw=;
        b=mInuM3BomijaB5dkcqiPvPKK5VHT+6Iy8+Aq1QEagr6uy02KPqfSznEJ+RfrO8X2lg
         pfhL+ZAWSt8/WPpG/kurCqSlupX+FDNDTTEbxmMpjpE2ZhIoKODAiEOz7hftyqt/loCH
         aGcaEULlqja203QTzHsfIt6f5OJJ6uo0trg7deNEzIymH5oewDj+YYd7OL7lXVhsZVKG
         jz7mSaSfoxoPQGhPK+f3Tj0BP72HQeQv4Hwv9qxi+pHTy6RoemQ5xmnsnyuJOcUqaDoA
         L3h4woAuK8m4i109sY6LzNLjBtax7o5ZZ7VQTy7JwV7EE7Z2fqa36m42DUJt5sENODPq
         Ni8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=ydbYF0D7QAu7P1+NQVQLTUDzbcrzMyEp6Q2vaSMl/rw=;
        b=ljzctux8YCvbS9Wlo/ucHpvuKfXEoTV5qOm88vna6y4+hjig5uBh/guG1nhGxpWqFN
         Hb5ojV9gLw1QJgHKQVgUQ5aJN/0fiKhno+/Nm39V1T42G6m2zeVM3huC/dakGZb/3HOJ
         tYApaiNmZtssdYspHRV+5XG4sU9FC2z0p+FWl1WjmCmr4EI5f+x6TkexLd7r7mn4Q/VU
         arhJ8u+OHf7fAgVnSfINLs2L88lVHcs9rOebnKgBedFZRby6jHBChTeSHL3gPdMI0IxV
         4XOoP+Nh1ewOgOqSNbaG3u89IRHKcgV7eNEnZAV+ykFT7XwADXjWGQMzeGhpIZb9qMF7
         RuJg==
X-Gm-Message-State: APjAAAUNwqOmzhkN7rZcYrmyP75Mo/T98v/jLb/NfDOyicvnOYQYQM2i
        OGZ6Oh4uCQk6KAqpR+tyJVdIYw==
X-Google-Smtp-Source: APXvYqwvPaBSvzQJwY/oOpco0RS56cu12JMOwhXZt+xPz01YyKCzDz71O2pLHLCzFweq+CXt0g26Og==
X-Received: by 2002:a05:620a:110c:: with SMTP id o12mr21630605qkk.66.1580210431039;
        Tue, 28 Jan 2020 03:20:31 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id z4sm11821742qkz.62.2020.01.28.03.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 03:20:30 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 0/9] Introduce Data Access MONitor (DAMON)
Date:   Tue, 28 Jan 2020 06:20:29 -0500
Message-Id: <41BBD985-4B3D-4F87-B69D-D8CFE6EC0EBE@lca.pw>
References: <20200128104942.11419-1-sjpark@amazon.com>
Cc:     akpm@linux-foundation.org, SeongJae Park <sjpark@amazon.de>,
        sj38.park@gmail.com, acme@kernel.org, amit@kernel.org,
        brendan.d.gregg@gmail.com, corbet@lwn.net, dwmw@amazon.com,
        mgorman@suse.de, rostedt@goodmis.org, kirill@shutemov.name,
        brendanhiggins@google.com, colin.king@canonical.com,
        minchan@kernel.org, vdavydov.dev@gmail.com, vdavydov@parallels.com,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20200128104942.11419-1-sjpark@amazon.com>
To:     sjpark@amazon.com
X-Mailer: iPhone Mail (17C54)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Jan 28, 2020, at 5:50 AM, sjpark@amazon.com wrote:
>=20
> For the comments from perf maintainers, I added Steven Rostedt and Arnaldo=

> Carvalho de Melo first, but I might missed someone.  If you recommend some=
 more
> people, I will add them to recipients.
>=20
> I made DAMON as a new subsystem because I think no existing subsystem fits=
 well
> to be a base of DAMON, due to DAMON's unique goals and mechanisms describe=
d
> below in the original cover letter.
>=20
> The existing subsystem that most similar to DAMON might be 'mm/page_idle.c=
'.
> However, there are many conceptual differences with DAMON.  One biggest
> difference I think is the target.  'page_idle' deals with physical page fr=
ames
> while DAMON deals with virtual address of specific processes.
>=20
> Nevertheless, if you have some different opinion, please let me know.

I thought everyone should know to go to the MAINTAINERS file and search PERFO=
RMANCE EVENTS SUBSYSTEM.

It might be difficult but there is a perf subcommand for some subsystems lik=
e sched: tracing/measuring of scheduler actions and latencies.=
