Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC581AB031
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2020 19:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411598AbgDOR6k (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Apr 2020 13:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2411595AbgDOR6h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Apr 2020 13:58:37 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A499EC061A0E
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2020 10:58:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f13so927087wrm.13
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2020 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eFD9x/dSIEUfzCFoJjNZCqEIi04lcE4fTMcXRLYjFdQ=;
        b=jDEpO4Og/WRkRTpK1nmwq1px2vFNMlBEtptiPkL96YTLJ050YqOkFOPf9usax5ANAh
         xV6KeqcFaQNlqslIEYoTxVae8J0WndPH2ei++qxgBOp4kQ8ToTUfu0uJl4CnPUkWYr6V
         zAKaiuJjM/9pHxrWdtsaRMYUTQJp+VrXTedMgIjG6Vc8OEZH9LOm3UAitO9HK6d1BaKb
         gmtVZ6oyd2SH10s3IPcBygZDd21frfRvOL0g0CS4Y1tuoGQsWRB8Vm6OfM1vk1pSpPni
         VQbWex0Hj/oiGB1J+/LLGJaGmIWYBL+n1zRL1DcwbjIgfARa52/tnDZSkMmu6nhYX8vr
         RtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eFD9x/dSIEUfzCFoJjNZCqEIi04lcE4fTMcXRLYjFdQ=;
        b=SpMFkqrtTl0mnfa/7NMiy5trQNLRZ74cpkf3VBon8Xa0OgFvMZz4+VpS7K/D1GFmdR
         qjRvDmjve2sd9V45mbWZ+LKgDAcA6B0HHzQ+Dt+uHVfbGDjoPfwoWKSBanYfXigp2kk/
         GZhHYW3hzVWwfPRv1nvWYulBoTusSLWeyM9QkGkfX/yZdPwB0iGX20Rz53fMbRurxhAR
         DycYPxxjU+UFV7wSGlpH1Xf+d21uuic2XkYlzMCIURG/jNOpXoYIKnWdCEpvwPHy09em
         cQ2LvjmiI/MArGN6DUAGsaVAjM9YDgNiQvAkLtVcZ3rR6bXRSHDMJtedqiiGuyFy6Xnz
         +RLw==
X-Gm-Message-State: AGi0PuYfD08kP2RanTJ3f9IpBDS5jUewTOpvNH9GDhuoBSxAuzFUCM/j
        T/5qMKtgHPNlZCb51P90XvKD9A==
X-Google-Smtp-Source: APiQypJRVMbsZUt1VUZjyJjcdO/01wBJZiCKW205scfSnwvwm9kAMmQF1elImRzaPco/pydl8EAUQw==
X-Received: by 2002:adf:fa03:: with SMTP id m3mr18227322wrr.68.1586973514021;
        Wed, 15 Apr 2020 10:58:34 -0700 (PDT)
Received: from google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id v16sm354492wml.30.2020.04.15.10.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:58:32 -0700 (PDT)
Date:   Wed, 15 Apr 2020 19:58:25 +0200
From:   Marco Elver <elver@google.com>
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     brendanhiggins@google.com, frowand.list@gmail.com,
        gregkh@linuxfoundation.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, corbet@lwn.net,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 kunit-next 1/4] kunit: add debugfs
 /sys/kernel/debug/kunit/<suite>/results display
Message-ID: <20200415175825.GA79987@google.com>
References: <1585232710-322-1-git-send-email-alan.maguire@oracle.com>
 <1585232710-322-2-git-send-email-alan.maguire@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585232710-322-2-git-send-email-alan.maguire@oracle.com>
User-Agent: Mutt/1.13.2 (2019-12-18)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Thu, 26 Mar 2020, Alan Maguire wrote:

> add debugfs support for displaying kunit test suite results; this is
> especially useful for module-loaded tests to allow disentangling of
> test result display from other dmesg events.  debugfs support is
> provided if CONFIG_KUNIT_DEBUGFS=y.
> 
> As well as printk()ing messages, we append them to a per-test log.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Frank Rowand <frank.rowand@sony.com>
> ---
>  include/kunit/test.h   |  54 +++++++++++++++---
>  lib/kunit/Kconfig      |   8 +++
>  lib/kunit/Makefile     |   4 ++
>  lib/kunit/debugfs.c    | 116 ++++++++++++++++++++++++++++++++++++++
>  lib/kunit/debugfs.h    |  30 ++++++++++
>  lib/kunit/kunit-test.c |   4 +-
>  lib/kunit/test.c       | 147 ++++++++++++++++++++++++++++++++++++++-----------
>  7 files changed, 322 insertions(+), 41 deletions(-)
>  create mode 100644 lib/kunit/debugfs.c
>  create mode 100644 lib/kunit/debugfs.h
> 
[...]
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 9242f93..a3fa21f 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
[...]
> -static void kunit_print_ok_not_ok(bool should_indent,
> +static void kunit_print_ok_not_ok(void *test_or_suite,
> +				  bool is_test,
>  				  bool is_ok,
>  				  size_t test_number,
>  				  const char *description)
>  {
> -	const char *indent, *ok_not_ok;
> -
> -	if (should_indent)
> -		indent = "\t";
> -	else
> -		indent = "";
> +	struct kunit_suite *suite = is_test ? NULL : test_or_suite;
> +	struct kunit *test = is_test ? test_or_suite : NULL;
>  
> -	if (is_ok)
> -		ok_not_ok = "ok";
> +	/*
> +	 * We do not log the test suite results as doing so would
> +	 * mean debugfs display would consist of the test suite
> +	 * description and status prior to individual test results.
> +	 * Hence directly printk the suite status, and we will
> +	 * separately seq_printf() the suite status for the debugfs
> +	 * representation.
> +	 */
> +	if (suite)
> +		pr_info("%s %zd - %s",

I think this is missing '\n' -- is this intentional?

With v5.7-rc1, when I run a test via module, the final "ok" is only
printed once another message is printed to the kernel log (which can
take a while).

Thanks,
-- Marco

> +			kunit_status_to_string(is_ok),
> +			test_number, description);
>  	else
> -		ok_not_ok = "not ok";
> -
> -	pr_info("%s%s %zd - %s\n", indent, ok_not_ok, test_number, description);
> +		kunit_log(KERN_INFO, test, "\t%s %zd - %s",
> +			  kunit_status_to_string(is_ok),
> +			  test_number, description);
>  }
[...]
