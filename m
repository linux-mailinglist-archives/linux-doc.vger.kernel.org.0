Return-Path: <linux-doc+bounces-61764-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3C8B9C2EF
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 22:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 077357AC6EE
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 20:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3381022D7A9;
	Wed, 24 Sep 2025 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LII9TMNx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A39B3D544
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 20:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746731; cv=none; b=fZ34eq5FTGfQ32lRgDoYHgpjoTAZim+0ldiS6MzPzvPBFchXFgOsFBRMF/yqRKr9j2vhCV7I6AUUl69jW5RhZfj80MdoRa4fCPLI+9nKt8IwynY70Oly30NyPS1lzn+zDZG3C1CCqpR+WggOeXviHsz4LoaZUPP3Hex7VfXgP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746731; c=relaxed/simple;
	bh=dMmVqrBoJBy9oTGr/bRGNHBVw2Ky8S8Wn5lKYFL39Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixGF/gLWarLQhL8NtLvGn1tONZparmHyQtGwJc+ieeE+4ieFEOSV4FUdtCOsyoLnrCKjHaAB+qM740vwKuDigs1xzUGen01hprYo/ZS/9O2yIYwTHTZcwuANBdz2bwW8Pn602l4y2BTtfQaV6JWkoAGThuLdkL5sMa9rm3Zn+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LII9TMNx; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3306b83ebdaso249492a91.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758746729; x=1759351529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w1mp7LI1ysXg3EhsS9eEgLmna2zUSv012OjKVUUaPuY=;
        b=LII9TMNxw4I1AmnyrOOkFro/CbidwadyImWCLMAzWT94XZyZdH6peLSmaonW0F2B+h
         CWalYku0ka4Vn2b3q9WwKFEL11lnTUGF88UU57uA/WYm4FpscsEWngRlA8DKFvyie5ra
         47ftfc1LELPNLZEqOLIj4T71nltE+v7C7TIai+YuhQwr2papbQGYrorZvacTVBUEGnkD
         N5gRE5B2hJbQde+XGPVqHPqkJuJ7CM5UURUDqlT8I4PBTfgB7hFcqWZ3cUKjkZnKfUG4
         zW8XnSL2PHqFjqP7P+ZVMJ6N4S0nXFh4PGsF568mkpGbwSNN8cJ4t+NHOvQnfYOcizdH
         a2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746729; x=1759351529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1mp7LI1ysXg3EhsS9eEgLmna2zUSv012OjKVUUaPuY=;
        b=QD6zI/vkjUguLq7+aUzWAe7rR1EjtalNplxjNc/i/uSvLO2sio4F4cdyfHBVEoPCdk
         uiK4HU/nZ4OgNNZoHbSdvBfA3VLZOUV4YwS+kbJwwv7DZZayd6vafCd6dK4ykRiS64SI
         Xdj5W1J5FQy3McT3FnECrukeX4GZBywr1+UFprLcOE+ylWmJ2v1NCzjoH+QyIoTsdzq4
         6j+8LLvLlKAZnlqoKnQv1v/JfTIUy+CLzYPcLqbseDDvIF8vq7pYAV/SQ884AduLHaUM
         bXtIpTZQ6PwHBjOYe3K6XWWFpPNX3aeRJcQfe0m22oRE5iY1+ff+qD6Yp6yt9pICgZIB
         hwLg==
X-Forwarded-Encrypted: i=1; AJvYcCXEFpGYr94B4uxV119+spglwQutOgFSdkCbvazUtXv3/JAAGD3NTmrnTpqnl5iEW1oo4tDqEKwkKcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Yawp+b4NiqmfkexAsHTpl/BiON3G/WeygZd5H7A1GEW7plzo
	p3K9SyvVsTF8mFKlhPz+pa/OeSUOcSUbiyyK5ZbrIL9qu2TxgNMcaLDNtZKQ9Dt4/hmd0Kq4kk/
	fL1bPLYDDCw4/kFAfrWv1hYsc4ZBb11CEkZe/JG66
X-Gm-Gg: ASbGncvWTK972b4Uk1kulMjm/Kw16CKkGSjD/HaWiwruF6j9WfS52QuXVls51w6G20g
	uDK6MA6cLZUhMVtVs2kNNOXb9VNfCh6pdNqdKW2eognbHpeKfeVPV+1SiPa+pdz5i7Tzls+89Qm
	ixRpCtHd9c6PfzoZvRb/vPp4qvY1KAlh5fHCWBBVHjEGGiEXV16XF4ygMo9pkzg5C1vxTLCPPCc
	eLqUycaZF44gbbmgfCASSwzeYqLaa3yMIH2SNuf8kvaD89YWTyyHDI=
X-Google-Smtp-Source: AGHT+IG5FWt7iq/CV/zlunKOA9NXinKsoKdyEfBdiOZJ0QuQFE99G9zMO7C0YiiJ5ESmkgWunqzf9iW2ydB6TJVee/I=
X-Received: by 2002:a17:90b:2249:b0:32e:9da9:3e6c with SMTP id
 98e67ed59e1d1-3342a2f9230mr918488a91.23.1758746727946; Wed, 24 Sep 2025
 13:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
 <20250924115931.197077-1-wangjinchao600@gmail.com> <20250924115931.197077-2-wangjinchao600@gmail.com>
In-Reply-To: <20250924115931.197077-2-wangjinchao600@gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 24 Sep 2025 22:44:50 +0200
X-Gm-Features: AS18NWALn8StkZt7OAMLGvWBoEjnvi0uixTT5lbJc-ZUHb99wQUtu6-AQu7N2zA
Message-ID: <CANpmjNNnVx3=dQsoHL+T-95Z_iprCd3FXeYpnHdmi4d06X-x_g@mail.gmail.com>
Subject: Re: [PATCH v5 17/23] mm/ksw: add test module
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>, 
	Naveen N Rao <naveen@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Nam Cao <namcao@linutronix.de>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, "David S. Miller" <davem@davemloft.net>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 14:00, Jinchao Wang <wangjinchao600@gmail.com> wrote:
>
> Introduce a separate test module to validate functionality in controlled
> scenarios.
>
> The module provides a proc interface (/proc/kstackwatch_test) that allows
> triggering specific test cases via simple commands:
>
>   echo test0 > /proc/kstackwatch_test

This should not be in /proc/ - if anything, it should go into debugfs.

> Test module is built with optimizations disabled to ensure predictable
> behavior.
>
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> ---
>  mm/Kconfig.debug        |  10 ++++
>  mm/kstackwatch/Makefile |   6 ++
>  mm/kstackwatch/test.c   | 122 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 mm/kstackwatch/test.c
>
> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index 89be351c0be5..291dd8a78b98 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -317,3 +317,13 @@ config KSTACK_WATCH
>           A lightweight real-time debugging tool to detect stack corrupting.
>
>           If unsure, say N.
> +
> +config KSTACK_WATCH_TEST
> +       tristate "KStackWatch Test Module"
> +       depends on KSTACK_WATCH
> +       help
> +         This module provides controlled stack corruption scenarios to verify
> +         the functionality of KStackWatch. It is useful for development and
> +         validation of KStackWatch mechanism.
> +
> +         If unsure, say N.
> diff --git a/mm/kstackwatch/Makefile b/mm/kstackwatch/Makefile
> index 84a46cb9a766..d007b8dcd1c6 100644
> --- a/mm/kstackwatch/Makefile
> +++ b/mm/kstackwatch/Makefile
> @@ -1,2 +1,8 @@
>  obj-$(CONFIG_KSTACK_WATCH)     += kstackwatch.o
>  kstackwatch-y := kernel.o stack.o watch.o
> +
> +obj-$(CONFIG_KSTACK_WATCH_TEST)        += kstackwatch_test.o
> +kstackwatch_test-y := test.o
> +CFLAGS_test.o := -fno-inline \
> +               -fno-optimize-sibling-calls \
> +               -fno-pic -fno-pie -O0 -Og
> diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
> new file mode 100644
> index 000000000000..1ed98931cc51
> --- /dev/null
> +++ b/mm/kstackwatch/test.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/prandom.h>
> +#include <linux/printk.h>
> +#include <linux/proc_fs.h>
> +#include <linux/random.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +#include <linux/uaccess.h>
> +
> +#include "kstackwatch.h"
> +
> +static struct proc_dir_entry *test_proc;
> +
> +#define BUFFER_SIZE 16
> +#define MAX_DEPTH 6
> +
> +struct work_node {
> +       ulong *ptr;
> +       struct completion done;
> +       struct list_head list;
> +};
> +
> +static DECLARE_COMPLETION(work_res);
> +static DEFINE_MUTEX(work_mutex);
> +static LIST_HEAD(work_list);
> +
> +static void test_watch_fire(void)
> +{
> +       u64 buffer[BUFFER_SIZE] = { 0 };
> +
> +       pr_info("entry of %s\n", __func__);
> +       ksw_watch_show();
> +       ksw_watch_fire();
> +       pr_info("buf[0]:%lld\n", buffer[0]);
> +
> +       barrier_data(buffer);
> +       pr_info("exit of %s\n", __func__);
> +}
> +
> +
> +static ssize_t test_proc_write(struct file *file, const char __user *buffer,
> +                              size_t count, loff_t *pos)
> +{
> +       char cmd[256];
> +       int test_num;
> +
> +       if (count >= sizeof(cmd))
> +               return -EINVAL;
> +
> +       if (copy_from_user(cmd, buffer, count))
> +               return -EFAULT;
> +
> +       cmd[count] = '\0';
> +       strim(cmd);
> +
> +       pr_info("received command: %s\n", cmd);
> +
> +       if (sscanf(cmd, "test%d", &test_num) == 1) {
> +               switch (test_num) {
> +               case 0:
> +                       test_watch_fire();
> +                       break;
> +               default:
> +                       pr_err("Unknown test number %d\n", test_num);
> +                       return -EINVAL;
> +               }
> +       } else {
> +               pr_err("invalid command format. Use 'testN'.\n");
> +               return -EINVAL;
> +       }
> +
> +       return count;
> +}
> +
> +static ssize_t test_proc_read(struct file *file, char __user *buffer,
> +                             size_t count, loff_t *pos)
> +{
> +       static const char usage[] = "KStackWatch Simplified Test Module\n"
> +                                   "============ usage ==============\n"
> +                                   "Usage:\n"
> +                                   "echo test{i} > /proc/kstackwatch_test\n"
> +                                   " test0 - test watch fire\n";
> +
> +       return simple_read_from_buffer(buffer, count, pos, usage,
> +                                      strlen(usage));
> +}
> +
> +static const struct proc_ops test_proc_ops = {
> +       .proc_read = test_proc_read,
> +       .proc_write = test_proc_write,
> +};
> +
> +static int __init kstackwatch_test_init(void)
> +{
> +       test_proc = proc_create("kstackwatch_test", 0600, NULL, &test_proc_ops);
> +       if (!test_proc) {
> +               pr_err("Failed to create proc entry\n");
> +               return -ENOMEM;
> +       }
> +       pr_info("module loaded\n");
> +       return 0;
> +}
> +
> +static void __exit kstackwatch_test_exit(void)
> +{
> +       if (test_proc)
> +               remove_proc_entry("kstackwatch_test", NULL);
> +       pr_info("module unloaded\n");
> +}
> +
> +module_init(kstackwatch_test_init);
> +module_exit(kstackwatch_test_exit);
> +
> +MODULE_AUTHOR("Jinchao Wang");
> +MODULE_DESCRIPTION("Simple KStackWatch Test Module");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20250924115931.197077-2-wangjinchao600%40gmail.com.

