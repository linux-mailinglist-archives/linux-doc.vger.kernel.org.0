Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1A416168B
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2020 16:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbgBQPpf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Feb 2020 10:45:35 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:60190 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729327AbgBQPpe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 10:45:34 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01HFVxDl065512;
        Mon, 17 Feb 2020 15:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=corp-2020-01-29;
 bh=uIZ4vOP4j6YcrYVrjPqKdOg2tkgwSjNheWrWFWaL3D4=;
 b=xcpgFbqUaSZFENSNU6bzwt2kxgVOsVrO3mYRYMlvBKfEAsSNsIIsvDtTvgcfVpS7jFi5
 EARqcs95tuhCCInZVytjF9eKSn8xABBJi6zAJlSD4Co9wCtkouxCcjy9rhjZg95iRS3t
 b8OrEkN3bkYgSPN+RLr2YE9pFrucIgt7wEkhycXKyRGVv1qk/s4mZWJWyWy0w5/TlVHC
 j/rDPQKRkUbnp/B1IVYtTwcDHp2TB7FPYrd0pBWdBiZLwdEMrt1BJCWmhbvQjoRy6g/j
 cighK/aLiSnTz8F1DlUAKgPOTwFvv5XgctvFmcgrboQx570klJZsD+lrp8TyxOXuZs9q lQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2y699rgtn5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Feb 2020 15:45:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01HFShIc046343;
        Mon, 17 Feb 2020 15:45:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2y6t6twn2p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Feb 2020 15:45:24 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01HFjH6L023093;
        Mon, 17 Feb 2020 15:45:17 GMT
Received: from dhcp-10-175-161-198.vpn.oracle.com (/10.175.161.198)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 Feb 2020 07:45:16 -0800
Date:   Mon, 17 Feb 2020 15:45:08 +0000 (GMT)
From:   Alan Maguire <alan.maguire@oracle.com>
X-X-Sender: alan@dhcp-10-175-161-198.vpn.oracle.com
To:     Frank Rowand <frowand.list@gmail.com>
cc:     Alan Maguire <alan.maguire@oracle.com>, brendanhiggins@google.com,
        gregkh@linuxfoundation.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, davidgow@google.com
Subject: Re: [PATCH v3 kunit-next 1/2] kunit: add debugfs
 /sys/kernel/debug/kunit/<suite>/results display
In-Reply-To: <c42ac237-476a-526f-b445-61e7a63bc101@gmail.com>
Message-ID: <alpine.LRH.2.20.2002171539210.21685@dhcp-10-175-161-198.vpn.oracle.com>
References: <1581094694-6513-1-git-send-email-alan.maguire@oracle.com> <1581094694-6513-2-git-send-email-alan.maguire@oracle.com> <c42ac237-476a-526f-b445-61e7a63bc101@gmail.com>
User-Agent: Alpine 2.20 (LRH 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9533 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=11 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9533 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=11
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002170127
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 12 Feb 2020, Frank Rowand wrote:

> On 2/7/20 10:58 AM, Alan Maguire wrote:
> > add debugfs support for displaying kunit test suite results; this is
> > especially useful for module-loaded tests to allow disentangling of
> > test result display from other dmesg events.
> > 
> > As well as printk()ing messages, we append them to a per-test log.
> > 
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > ---
> >  include/kunit/test.h   |  52 ++++++++++++++++---
> >  lib/kunit/Makefile     |   3 +-
> >  lib/kunit/debugfs.c    | 105 ++++++++++++++++++++++++++++++++++++++
> >  lib/kunit/debugfs.h    |  16 ++++++
> >  lib/kunit/kunit-test.c |   4 +-
> >  lib/kunit/test.c       | 136 ++++++++++++++++++++++++++++++++++++++-----------
> >  6 files changed, 274 insertions(+), 42 deletions(-)
> >  create mode 100644 lib/kunit/debugfs.c
> >  create mode 100644 lib/kunit/debugfs.h
> > 
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 2dfb550..6a73c4e 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -81,6 +81,9 @@ struct kunit_resource {
> >  
> >  struct kunit;
> >  
> > +/* Size of "lastrun" log associated with test. */
> > +#define KUNIT_LOG_SIZE	512
> > +
> >  /**
> >   * struct kunit_case - represents an individual test case.
> >   *
> > @@ -123,8 +126,14 @@ struct kunit_case {
> >  
> >  	/* private: internal use only. */
> >  	bool success;
> > +	char *log;
> >  };
> >  
> > +static inline char *kunit_status_to_string(bool status)
> > +{
> > +	return status ? "ok" : "not ok";
> > +}
> > +
> >  /**
> >   * KUNIT_CASE - A helper for creating a &struct kunit_case
> >   *
> > @@ -157,6 +166,10 @@ struct kunit_suite {
> >  	int (*init)(struct kunit *test);
> >  	void (*exit)(struct kunit *test);
> >  	struct kunit_case *test_cases;
> > +
> > +	/* private - internal use only */
> > +	struct dentry *debugfs;
> > +	char *log;
> >  };
> >  
> >  /**
> > @@ -175,6 +188,7 @@ struct kunit {
> >  
> >  	/* private: internal use only. */
> >  	const char *name; /* Read only after initialization! */
> > +	char *log; /* Points at case log after initialization */
> >  	struct kunit_try_catch try_catch;
> >  	/*
> >  	 * success starts as true, and may only be set to false during a
> > @@ -193,10 +207,19 @@ struct kunit {
> >  	struct list_head resources; /* Protected by lock. */
> >  };
> >  
> > -void kunit_init_test(struct kunit *test, const char *name);
> > +void kunit_init_test(struct kunit *test, const char *name, char *log);
> >  
> >  int kunit_run_tests(struct kunit_suite *suite);
> >  
> > +size_t kunit_suite_num_test_cases(struct kunit_suite *suite);
> > +
> > +unsigned int kunit_test_case_num(struct kunit_suite *suite,
> > +				 struct kunit_case *test_case);
> > +
> > +int __kunit_test_suites_init(struct kunit_suite **suites);
> > +
> > +void __kunit_test_suites_exit(struct kunit_suite **suites);
> > +
> >  /**
> >   * kunit_test_suites() - used to register one or more &struct kunit_suite
> >   *			 with KUnit.
> > @@ -226,20 +249,24 @@ struct kunit {
> >  	static struct kunit_suite *suites[] = { __VA_ARGS__, NULL};	\
> >  	static int kunit_test_suites_init(void)				\
> >  	{								\
> > -		unsigned int i;						\
> > -		for (i = 0; suites[i] != NULL; i++)			\
> > -			kunit_run_tests(suites[i]);			\
> > -		return 0;						\
> > +		return __kunit_test_suites_init(suites);		\
> >  	}								\
> >  	late_initcall(kunit_test_suites_init);				\
> >  	static void __exit kunit_test_suites_exit(void)			\
> >  	{								\
> > -		return;							\
> > +		return __kunit_test_suites_exit(suites);		\
> >  	}								\
> >  	module_exit(kunit_test_suites_exit)
> >  
> >  #define kunit_test_suite(suite)	kunit_test_suites(&suite)
> >  
> > +#define kunit_suite_for_each_test_case(suite, test_case)		\
> > +	for (test_case = suite->test_cases;				\
> > +	     test_case && test_case->run_case;				\
> 
> test_case does not become NULL for the final entry in suite->test_cases
> so do not test for such.
>

thanks for spotting this; I've fixed in v4.
 
> 
> > +	     test_case++)
> > +
> > +bool kunit_suite_has_succeeded(struct kunit_suite *suite);
> > +
> >  /*
> >   * Like kunit_alloc_resource() below, but returns the struct kunit_resource
> >   * object that contains the allocation. This is mostly for testing purposes.
> > @@ -356,8 +383,17 @@ static inline void *kunit_kzalloc(struct kunit *test, size_t size, gfp_t gfp)
> >  
> >  void kunit_cleanup(struct kunit *test);
> >  
> > -#define kunit_printk(lvl, test, fmt, ...) \
> > -	printk(lvl "\t# %s: " fmt, (test)->name, ##__VA_ARGS__)
> > +/* printk and log to per-test or per-suite log buffer */
> > +#define kunit_log(lvl, test, fmt, ...)				\
> 
> 'test' can be either a test or a suite, so this name is misleading.  I suggest
> changing it to test_or_suite.
>

good point; fixed also.
 
> 
> > +	do {								\
> > +		printk(lvl fmt, ##__VA_ARGS__);				\
> > +		snprintf((test)->log, KUNIT_LOG_SIZE,			\
> > +			  "%s" fmt "\n",				\
> > +			 (test)->log, ##__VA_ARGS__);			\
> > +	} while (0)
> > +
> 
> If kunit_log() is called multiple times in a test run for a single test case,
> does each call overwrite the previous value of (test)->log?  For example,
> kunit_print_subtest_start() calls kunit_log() twice.
> 

Yep, this works. However it's better to have a test that
confirms that, so I've added such a test in patch 2.

> 
> > +#define kunit_printk(lvl, test, fmt, ...)				\
> > +	kunit_log(lvl, test, "\t# %s: " fmt, (test)->name, ##__VA_ARGS__)
> >  
> >  /**
> >   * kunit_info() - Prints an INFO level message associated with @test.
> > diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> > index fab5564..869aab0 100644
> > --- a/lib/kunit/Makefile
> > +++ b/lib/kunit/Makefile
> > @@ -3,7 +3,8 @@ obj-$(CONFIG_KUNIT) +=			kunit.o
> >  kunit-objs +=				test.o \
> >  					string-stream.o \
> >  					assert.o \
> > -					try-catch.o
> > +					try-catch.o \
> > +					debugfs.o
> >  
> >  obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
> >  
> 
> Please make debugfs.o configurable distinctly from KUNIT.  Or it
> might be possible to make KUNIT_LOG_SIZE zero (and make sure the
> code handles a NULL log) if that is easier to implement.
> 
> The data size of the log buffers could otherwise be excessively
> large for a tiny resource constrained embedded platform.  For
> example, with the proposed KUNIT_LOG_SIZE of 512, if there were
> 200 test cases enabled, the log space would be 100k bytes.  If
> 2000 test cases were enabled, the log space would be 1000k bytes.
> 
> I can easily imagine a user configuring an acceptance test with
> tens of thousands of test cases.
>

I've added a boolean CONFIG_KUNIT_DEBUGFS; when set to 'n'
no logs are allocated or used.  There seemed to be precendents
with other CONFIG_*_DEBUGFS variables.
 
> 
> > diff --git a/lib/kunit/debugfs.c b/lib/kunit/debugfs.c
> > new file mode 100644
> > index 0000000..b856d6b
> > --- /dev/null
> > +++ b/lib/kunit/debugfs.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020, Oracle and/or its affiliates.
> > + *    Author: Alan Maguire <alan.maguire@oracle.com>
> > + */
> > +
> > +#include <linux/debugfs.h>
> > +#include <linux/module.h>
> > +
> > +#include <kunit/test.h>
> > +
> > +#include "string-stream.h"
> > +
> > +#define KUNIT_DEBUGFS_ROOT             "kunit"
> > +#define KUNIT_DEBUGFS_RESULTS          "results"
> > +
> > +/*
> > + * Create a debugfs representation of test suites:
> > + *
> > + * Path						Semantics
> > + * /sys/kernel/debug/kunit/<testsuite>/results	Show results of last run for
> > + *						testsuite
> > + *
> > + */
> > +
> > +static struct dentry *debugfs_rootdir;
> > +
> > +void kunit_debugfs_cleanup(void)
> > +{
> > +	debugfs_remove_recursive(debugfs_rootdir);
> > +}
> > +
> > +void kunit_debugfs_init(void)
> > +{
> > +	if (!debugfs_rootdir)
> > +		debugfs_rootdir = debugfs_create_dir(KUNIT_DEBUGFS_ROOT, NULL);
> > +}
> > +
> > +static void debugfs_print_result(struct seq_file *seq,
> > +				 struct kunit_suite *suite,
> > +				 struct kunit_case *test_case)
> > +{
> > +	if (!test_case)
> > +		return;
> > +
> > +	seq_printf(seq, "%s", test_case->log);
> > +}
> > +
> > +/*
> > + * /sys/kernel/debug/kunit/<testsuite>/results shows all results for testsuite.
> > + */
> > +static int debugfs_print_results(struct seq_file *seq, void *v)
> > +{
> > +	struct kunit_suite *suite = (struct kunit_suite *)seq->private;
> > +	bool success = kunit_suite_has_succeeded(suite);
> > +	struct kunit_case *test_case;
> > +
> > +	if (!suite)
> > +		return 0;
> > +
> > +	seq_printf(seq, "%s", suite->log);
> > +
> > +	kunit_suite_for_each_test_case(suite, test_case)
> > +		debugfs_print_result(seq, suite, test_case);
> > +
> > +	seq_printf(seq, "%s %d - %s\n",
> > +		   kunit_status_to_string(success), 1, suite->name);
> > +	return 0;
> > +}
> > +
> > +static int debugfs_release(struct inode *inode, struct file *file)
> > +{
> > +	return single_release(inode, file);
> > +}
> > +
> > +static int debugfs_results_open(struct inode *inode, struct file *file)
> > +{
> > +	struct kunit_suite *suite;
> > +
> > +	suite = (struct kunit_suite *)inode->i_private;
> > +
> > +	return single_open(file, debugfs_print_results, suite);
> > +}
> > +
> > +static const struct file_operations debugfs_results_fops = {
> > +	.open = debugfs_results_open,
> > +	.read = seq_read,
> > +	.llseek = seq_lseek,
> > +	.release = debugfs_release,
> > +};
> > +
> > +void kunit_debugfs_create_suite(struct kunit_suite *suite)
> > +{
> > +	/* First add /sys/kernel/debug/kunit/<testsuite> */
> > +	suite->debugfs = debugfs_create_dir(suite->name, debugfs_rootdir);
> > +
> > +	debugfs_create_file(KUNIT_DEBUGFS_RESULTS, S_IFREG | 0444,
> > +			    suite->debugfs,
> > +			    suite, &debugfs_results_fops);
> > +}
> > +
> > +void kunit_debugfs_destroy_suite(struct kunit_suite *suite)
> > +{
> > +	debugfs_remove_recursive(suite->debugfs);
> > +}
> > diff --git a/lib/kunit/debugfs.h b/lib/kunit/debugfs.h
> > new file mode 100644
> > index 0000000..9a92d5e
> > --- /dev/null
> > +++ b/lib/kunit/debugfs.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020, Oracle and/or its affiliates.
> > + */
> > +
> > +#ifndef _KUNIT_DEBUGFS_H
> > +#define _KUNIT_DEBUGFS_H
> > +
> > +#include <kunit/test.h>
> > +
> > +void kunit_debugfs_create_suite(struct kunit_suite *suite);
> > +void kunit_debugfs_destroy_suite(struct kunit_suite *suite);
> > +void kunit_debugfs_init(void);
> > +void kunit_debugfs_cleanup(void);
> > +
> > +#endif /* _KUNIT_DEBUGFS_H */
> > diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
> > index ccb8d2e..aceb5bf 100644
> > --- a/lib/kunit/kunit-test.c
> > +++ b/lib/kunit/kunit-test.c
> > @@ -134,7 +134,7 @@ static void kunit_resource_test_init_resources(struct kunit *test)
> >  {
> >  	struct kunit_test_resource_context *ctx = test->priv;
> >  
> > -	kunit_init_test(&ctx->test, "testing_test_init_test");
> > +	kunit_init_test(&ctx->test, "testing_test_init_test", NULL);
> >  
> >  	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
> >  }
> > @@ -301,7 +301,7 @@ static int kunit_resource_test_init(struct kunit *test)
> >  
> >  	test->priv = ctx;
> >  
> > -	kunit_init_test(&ctx->test, "test_test_context");
> > +	kunit_init_test(&ctx->test, "test_test_context", NULL);
> >  
> >  	return 0;
> >  }
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index 9242f93..aec607f 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/sched/debug.h>
> >  
> > +#include "debugfs.h"
> >  #include "string-stream.h"
> >  #include "try-catch-impl.h"
> >  
> > @@ -28,73 +29,91 @@ static void kunit_print_tap_version(void)
> >  	}
> >  }
> >  
> > -static size_t kunit_test_cases_len(struct kunit_case *test_cases)
> > +size_t kunit_suite_num_test_cases(struct kunit_suite *suite)
> >  {
> >  	struct kunit_case *test_case;
> >  	size_t len = 0;
> >  
> > -	for (test_case = test_cases; test_case->run_case; test_case++)
> > +	kunit_suite_for_each_test_case(suite, test_case)
> >  		len++;
> >  
> >  	return len;
> >  }
> > +EXPORT_SYMBOL_GPL(kunit_suite_num_test_cases);
> >  
> >  static void kunit_print_subtest_start(struct kunit_suite *suite)
> >  {
> >  	kunit_print_tap_version();
> > -	pr_info("\t# Subtest: %s\n", suite->name);
> > -	pr_info("\t1..%zd\n", kunit_test_cases_len(suite->test_cases));
> > +	kunit_log(KERN_INFO, suite, "# Subtest: %s", suite->name);
> > +	kunit_log(KERN_INFO, suite, "1..%zd",
> > +		  kunit_suite_num_test_cases(suite));
> 
> The subtest 'is a TAP stream indented 4 spaces'.  (So the old code was
> also incorrect since it indented with a tab.)
> 
> kunit_print_ok_not_ok() has a similar indentation issue.
>

I'll defer to Brendan on the TAP format stuff if you don't
mind; the aim here is to preserve existing behaviour.  I
think it might be better to tackle TAP format issues in
a separate patchset.

I also updated the documentation patch in v4 (patch 3)
to incorporate the suggested wording.

Thanks for the careful review!

Alan
 
> 
> >  }
> >  
> > -static void kunit_print_ok_not_ok(bool should_indent,
> > +static void kunit_print_ok_not_ok(void *test_or_suite,
> > +				  bool is_test,
> >  				  bool is_ok,
> >  				  size_t test_number,
> >  				  const char *description)
> >  {
> > -	const char *indent, *ok_not_ok;
> > +	struct kunit_suite *suite = is_test ? NULL : test_or_suite;
> > +	struct kunit *test = is_test ? test_or_suite : NULL;
> >  
> > -	if (should_indent)
> > -		indent = "\t";
> > -	else
> > -		indent = "";
> > -
> > -	if (is_ok)
> > -		ok_not_ok = "ok";
> > +	/*
> > +	 * We do not log the test suite results as doing so would
> > +	 * mean debugfs display would consist of the test suite
> > +	 * description and status prior to individual test results.
> > +	 * Hence directly printk the suite status, and we will
> > +	 * separately seq_printf() the suite status for the debugfs
> > +	 * representation.
> > +	 */
> > +	if (suite)
> > +		pr_info("%s %zd - %s",
> > +			kunit_status_to_string(is_ok),
> > +			test_number, description);
> >  	else
> > -		ok_not_ok = "not ok";
> > -
> > -	pr_info("%s%s %zd - %s\n", indent, ok_not_ok, test_number, description);
> > +		kunit_log(KERN_INFO, test, "\t%s %zd - %s",
> > +			  kunit_status_to_string(is_ok),
> > +			  test_number, description);
> >  }
> >  
> > -static bool kunit_suite_has_succeeded(struct kunit_suite *suite)
> > +bool kunit_suite_has_succeeded(struct kunit_suite *suite)
> >  {
> >  	const struct kunit_case *test_case;
> >  
> > -	for (test_case = suite->test_cases; test_case->run_case; test_case++)
> > +	kunit_suite_for_each_test_case(suite, test_case) {
> >  		if (!test_case->success)
> >  			return false;
> > +	}
> >  
> >  	return true;
> >  }
> > +EXPORT_SYMBOL_GPL(kunit_suite_has_succeeded);
> >  
> >  static void kunit_print_subtest_end(struct kunit_suite *suite)
> >  {
> >  	static size_t kunit_suite_counter = 1;
> >  
> > -	kunit_print_ok_not_ok(false,
> > +	kunit_print_ok_not_ok((void *)suite, false,
> >  			      kunit_suite_has_succeeded(suite),
> >  			      kunit_suite_counter++,
> >  			      suite->name);
> >  }
> >  
> > -static void kunit_print_test_case_ok_not_ok(struct kunit_case *test_case,
> > -					    size_t test_number)
> > +unsigned int kunit_test_case_num(struct kunit_suite *suite,
> > +				 struct kunit_case *test_case)
> >  {
> > -	kunit_print_ok_not_ok(true,
> > -			      test_case->success,
> > -			      test_number,
> > -			      test_case->name);
> > +	struct kunit_case *tc;
> > +	unsigned int i = 1;
> > +
> > +	kunit_suite_for_each_test_case(suite, tc) {
> > +		if (tc == test_case)
> > +			return i;
> > +		i++;
> > +	}
> > +
> > +	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(kunit_test_case_num);
> >  
> >  static void kunit_print_string_stream(struct kunit *test,
> >  				      struct string_stream *stream)
> > @@ -102,6 +121,9 @@ static void kunit_print_string_stream(struct kunit *test,
> >  	struct string_stream_fragment *fragment;
> >  	char *buf;
> >  
> > +	if (string_stream_is_empty(stream))
> > +		return;
> > +
> >  	buf = string_stream_get_string(stream);
> >  	if (!buf) {
> >  		kunit_err(test,
> > @@ -175,11 +197,14 @@ void kunit_do_assertion(struct kunit *test,
> >  }
> >  EXPORT_SYMBOL_GPL(kunit_do_assertion);
> >  
> > -void kunit_init_test(struct kunit *test, const char *name)
> > +void kunit_init_test(struct kunit *test, const char *name, char *log)
> >  {
> >  	spin_lock_init(&test->lock);
> >  	INIT_LIST_HEAD(&test->resources);
> >  	test->name = name;
> > +	test->log = log;
> > +	if (test->log)
> > +		test->log[0] = '\0';
> >  	test->success = true;
> >  }
> >  EXPORT_SYMBOL_GPL(kunit_init_test);
> > @@ -290,7 +315,7 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
> >  	struct kunit_try_catch *try_catch;
> >  	struct kunit test;
> >  
> > -	kunit_init_test(&test, test_case->name);
> > +	kunit_init_test(&test, test_case->name, test_case->log);
> >  	try_catch = &test.try_catch;
> >  
> >  	kunit_try_catch_init(try_catch,
> > @@ -303,19 +328,20 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
> >  	kunit_try_catch_run(try_catch, &context);
> >  
> >  	test_case->success = test.success;
> > +
> > +	kunit_print_ok_not_ok(&test, true, test_case->success,
> > +			      kunit_test_case_num(suite, test_case),
> > +			      test_case->name);
> >  }
> >  
> >  int kunit_run_tests(struct kunit_suite *suite)
> >  {
> >  	struct kunit_case *test_case;
> > -	size_t test_case_count = 1;
> >  
> >  	kunit_print_subtest_start(suite);
> >  
> > -	for (test_case = suite->test_cases; test_case->run_case; test_case++) {
> > +	kunit_suite_for_each_test_case(suite, test_case)
> >  		kunit_run_case_catch_errors(suite, test_case);
> > -		kunit_print_test_case_ok_not_ok(test_case, test_case_count++);
> > -	}
> >  
> >  	kunit_print_subtest_end(suite);
> >  
> > @@ -323,6 +349,51 @@ int kunit_run_tests(struct kunit_suite *suite)
> >  }
> >  EXPORT_SYMBOL_GPL(kunit_run_tests);
> >  
> > +static void kunit_init_suite(struct kunit_suite *suite)
> > +{
> > +	struct kunit_case *test_case;
> > +
> > +	/* Allocate logs before creating debugfs representation. */
> > +	suite->log = kzalloc(KUNIT_LOG_SIZE, GFP_KERNEL);
> > +	kunit_suite_for_each_test_case(suite, test_case)
> > +		test_case->log = kzalloc(KUNIT_LOG_SIZE, GFP_KERNEL);
> > +
> > +	kunit_debugfs_create_suite(suite);
> > +}
> > +
> > +int __kunit_test_suites_init(struct kunit_suite **suites)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; suites[i] != NULL; i++) {
> > +		kunit_init_suite(suites[i]);
> > +		kunit_run_tests(suites[i]);
> > +	}
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_test_suites_init);
> > +
> > +static void kunit_exit_suite(struct kunit_suite *suite)
> > +{
> > +	struct kunit_case *test_case;
> > +
> > +	/* Destroy debugfs representation before freeing logs used by it. */
> > +	kunit_debugfs_destroy_suite(suite);
> > +
> > +	kfree(suite->log);
> > +	kunit_suite_for_each_test_case(suite, test_case)
> > +		kfree(test_case->log);
> > +}
> > +
> > +void __kunit_test_suites_exit(struct kunit_suite **suites)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; suites[i] != NULL; i++)
> > +		kunit_exit_suite(suites[i]);
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
> > +
> >  struct kunit_resource *kunit_alloc_and_get_resource(struct kunit *test,
> >  						    kunit_resource_init_t init,
> >  						    kunit_resource_free_t free,
> > @@ -489,12 +560,15 @@ void kunit_cleanup(struct kunit *test)
> >  
> >  static int __init kunit_init(void)
> >  {
> > +	kunit_debugfs_init();
> > +
> >  	return 0;
> >  }
> >  late_initcall(kunit_init);
> >  
> >  static void __exit kunit_exit(void)
> >  {
> > +	kunit_debugfs_cleanup();
> >  }
> >  module_exit(kunit_exit);
> >  
> > 
> 
> 
