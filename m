Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E1D2CAE44
	for <lists+linux-doc@lfdr.de>; Tue,  1 Dec 2020 22:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgLAVSW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Dec 2020 16:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728581AbgLAVSV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 16:18:21 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DD2C0613D4
        for <linux-doc@vger.kernel.org>; Tue,  1 Dec 2020 13:17:35 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t37so1977958pga.7
        for <linux-doc@vger.kernel.org>; Tue, 01 Dec 2020 13:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yrQqCmw77Pyiuwgk2rT8QaIQKT88yDwYEAJlg3YBJLA=;
        b=UeMtAU6+4lmH3sz76LSboYXeuk6tLvLkLQPJ7nE6WmtN76GUJ+mFtUIFHTOb/A2nHk
         t/KbwO8fF3hvsW8haTt4l0e4VYHteb0RgonL3uz/cD56Fqd4tHdOcWcoSSKM9fj7fdlP
         KfdeM7+RBZSGXmx40wuqkiDKEYe2LZgpq3Jdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yrQqCmw77Pyiuwgk2rT8QaIQKT88yDwYEAJlg3YBJLA=;
        b=B/xUD0A7bJj1e+9x4WS/oOcIyeHTf1R0P+v0r30hjcajG3UAeg2yLwAf3vsQE10Yb/
         Te6a+OVNafOYjHea+KYu/70WEAu/y0vsv6CIp4jEmBBbDeOxAKJbfIdK58q7og8i63yH
         wcYchWhp29HIN8iHPEmNGbEKHa//Q7/PMutJBHjV5rYCnWkqW3QcdZSaNHyqu5KVmN3B
         MKwRxdrovjkfwhEh6t+GylMbkL/DTLkvxOd5m2vu3bJFPAd78MLrNNSRx5zEj9e/ZDw+
         XlJQjocI/VSWfdpuQJWLUVou9WnIy2qg1qyLNW7/F0I/O9htgT1FTFc8XFxz6b5Ev+Bl
         59hg==
X-Gm-Message-State: AOAM532QHeEHAVlak8482pTWgZxZO7oYgKFC5vvAVCIneFhN9l3imP48
        ZeVD7DhjyIhGOq/nCB6ZQdS5Qg==
X-Google-Smtp-Source: ABdhPJz1oCH9elwSOz1oAFRayKhwPL0loHheCBd/l7CYzx2gBiFpucUBIEEo2Z4LTcut6+IeJEGMsw==
X-Received: by 2002:a63:644:: with SMTP id 65mr1137853pgg.252.1606857455099;
        Tue, 01 Dec 2020 13:17:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f18sm638807pfa.167.2020.12.01.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:17:33 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:17:32 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Lutomirski <luto@amacapital.net>,
        Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 14/16] selftests: kselftest_harness.h: partially fix
 kernel-doc markups
Message-ID: <202012011315.E71F0B6B@keescook>
References: <cover.1606823973.git.mchehab+huawei@kernel.org>
 <cf4d5e686dd62eb2c0a3c2ee86da5377fec57e92.1606823973.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf4d5e686dd62eb2c0a3c2ee86da5377fec57e92.1606823973.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 01, 2020 at 01:09:07PM +0100, Mauro Carvalho Chehab wrote:
> The kernel-doc markups on this file are weird: they don't
> follow what's specified at:
> 
> 	Documentation/doc-guide/kernel-doc.rst
> 
> In particular, markups should use this format:
>         identifier - description
> 
> and not this:
> 	identifier(args)
> 
> The way the definitions are inside this file cause the
> parser to completely miss the identifier name of each
> function.
> 
> This prevents improving the script to do some needed validation
> tests.
> 
> Address this part. Yet, furter changes are needed in order
> for it to fully follow the specs.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  tools/testing/selftests/kselftest_harness.h | 22 ++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index edce85420d19..99920466076a 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -50,325 +50,325 @@
>  #ifndef __KSELFTEST_HARNESS_H
>  #define __KSELFTEST_HARNESS_H
>  
>  #ifndef _GNU_SOURCE
>  #define _GNU_SOURCE
>  #endif
>  #include <asm/types.h>
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/mman.h>
>  #include <sys/types.h>
>  #include <sys/wait.h>
>  #include <unistd.h>
>  
>  #include "kselftest.h"
>  
>  #define TEST_TIMEOUT_DEFAULT 30
>  
>  /* Utilities exposed to the test definitions */
>  #ifndef TH_LOG_STREAM
>  #  define TH_LOG_STREAM stderr
>  #endif
>  
>  #ifndef TH_LOG_ENABLED
>  #  define TH_LOG_ENABLED 1
>  #endif
>  
>  /**
> - * TH_LOG(fmt, ...)
> + * TH_LOG()
>   *
>   * @fmt: format string
>   * @...: optional arguments
>   *
>   * .. code-block:: c
>   *
>   *     TH_LOG(format, ...)
>   *
>   * Optional debug logging function available for use in tests.
>   * Logging may be enabled or disabled by defining TH_LOG_ENABLED.
>   * E.g., #define TH_LOG_ENABLED 1
>   *
>   * If no definition is provided, logging is enabled by default.
>   *
>   * If there is no way to print an error message for the process running the
>   * test (e.g. not allowed to write to stderr), it is still possible to get the
>   * ASSERT_* number for which the test failed.  This behavior can be enabled by
>   * writing `_metadata->no_print = true;` before the check sequence that is
>   * unable to print.  When an error occur, instead of printing an error message
>   * and calling `abort(3)`, the test process call `_exit(2)` with the assert
>   * number as argument, which is then printed by the parent process.
>   */
>  #define TH_LOG(fmt, ...) do { \
>  	if (TH_LOG_ENABLED) \
>  		__TH_LOG(fmt, ##__VA_ARGS__); \
>  } while (0)
>  
>  /* Unconditional logger for internal use. */
>  #define __TH_LOG(fmt, ...) \
>  		fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
>  			__FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
>  
>  /**
> - * SKIP(statement, fmt, ...)
> + * SKIP()
>   *
>   * @statement: statement to run after reporting SKIP
>   * @fmt: format string
>   * @...: optional arguments

Please add something like this to retain the "prototype" details:

 * .. code-block:: c
 *
 *     SKIP(statement, fmt, ...);

With that added, sure, looks good:

Acked-by: Kees Cook <keescook@chromium.org>

Thanks!

>   *
>   * Optional debug logging function available for use in tests.
>   *
>   * This forces a "pass" after reporting why something is being skipped
>   * and runs "statement", which is usually "return" or "goto skip".
>   */
>  #define SKIP(statement, fmt, ...) do { \
>  	snprintf(_metadata->results->reason, \
>  		 sizeof(_metadata->results->reason), fmt, ##__VA_ARGS__); \
>  	if (TH_LOG_ENABLED) { \
>  		fprintf(TH_LOG_STREAM, "#      SKIP      %s\n", \
>  			_metadata->results->reason); \
>  	} \
>  	_metadata->passed = 1; \
>  	_metadata->skip = 1; \
>  	_metadata->trigger = 0; \
>  	statement; \
>  } while (0)
>  
>  /**
> - * TEST(test_name) - Defines the test function and creates the registration
> + * TEST() - Defines the test function and creates the registration
>   * stub
>   *
>   * @test_name: test name
>   *
>   * .. code-block:: c
>   *
>   *     TEST(name) { implementation }
>   *
>   * Defines a test by name.
>   * Names must be unique and tests must not be run in parallel.  The
>   * implementation containing block is a function and scoping should be treated
>   * as such.  Returning early may be performed with a bare "return;" statement.
>   *
>   * EXPECT_* and ASSERT_* are valid in a TEST() { } context.
>   */
>  #define TEST(test_name) __TEST_IMPL(test_name, -1)
>  
>  /**
> - * TEST_SIGNAL(test_name, signal)
> + * TEST_SIGNAL()
>   *
>   * @test_name: test name
>   * @signal: signal number
>   *
>   * .. code-block:: c
>   *
>   *     TEST_SIGNAL(name, signal) { implementation }
>   *
>   * Defines a test by name and the expected term signal.
>   * Names must be unique and tests must not be run in parallel.  The
>   * implementation containing block is a function and scoping should be treated
>   * as such.  Returning early may be performed with a bare "return;" statement.
>   *
>   * EXPECT_* and ASSERT_* are valid in a TEST() { } context.
>   */
>  #define TEST_SIGNAL(test_name, signal) __TEST_IMPL(test_name, signal)
>  
>  #define __TEST_IMPL(test_name, _signal) \
>  	static void test_name(struct __test_metadata *_metadata); \
>  	static inline void wrapper_##test_name( \
>  		struct __test_metadata *_metadata, \
>  		struct __fixture_variant_metadata *variant) \
>  	{ \
>  		test_name(_metadata); \
>  	} \
>  	static struct __test_metadata _##test_name##_object = \
>  		{ .name = #test_name, \
>  		  .fn = &wrapper_##test_name, \
>  		  .fixture = &_fixture_global, \
>  		  .termsig = _signal, \
>  		  .timeout = TEST_TIMEOUT_DEFAULT, }; \
>  	static void __attribute__((constructor)) _register_##test_name(void) \
>  	{ \
>  		__register_test(&_##test_name##_object); \
>  	} \
>  	static void test_name( \
>  		struct __test_metadata __attribute__((unused)) *_metadata)
>  
>  /**
> - * FIXTURE_DATA(datatype_name) - Wraps the struct name so we have one less
> + * FIXTURE_DATA() - Wraps the struct name so we have one less
>   * argument to pass around
>   *
>   * @datatype_name: datatype name
>   *
>   * .. code-block:: c
>   *
>   *     FIXTURE_DATA(datatype_name)
>   *
>   * Almost always, you want just FIXTURE() instead (see below).
>   * This call may be used when the type of the fixture data
>   * is needed.  In general, this should not be needed unless
>   * the *self* is being passed to a helper directly.
>   */
>  #define FIXTURE_DATA(datatype_name) struct _test_data_##datatype_name
>  
>  /**
> - * FIXTURE(fixture_name) - Called once per fixture to setup the data and
> + * FIXTURE() - Called once per fixture to setup the data and
>   * register
>   *
>   * @fixture_name: fixture name
>   *
>   * .. code-block:: c
>   *
>   *     FIXTURE(fixture_name) {
>   *       type property1;
>   *       ...
>   *     };
>   *
>   * Defines the data provided to TEST_F()-defined tests as *self*.  It should be
>   * populated and cleaned up using FIXTURE_SETUP() and FIXTURE_TEARDOWN().
>   */
>  #define FIXTURE(fixture_name) \
>  	FIXTURE_VARIANT(fixture_name); \
>  	static struct __fixture_metadata _##fixture_name##_fixture_object = \
>  		{ .name =  #fixture_name, }; \
>  	static void __attribute__((constructor)) \
>  	_register_##fixture_name##_data(void) \
>  	{ \
>  		__register_fixture(&_##fixture_name##_fixture_object); \
>  	} \
>  	FIXTURE_DATA(fixture_name)
>  
>  /**
> - * FIXTURE_SETUP(fixture_name) - Prepares the setup function for the fixture.
> + * FIXTURE_SETUP() - Prepares the setup function for the fixture.
>   * *_metadata* is included so that EXPECT_* and ASSERT_* work correctly.
>   *
>   * @fixture_name: fixture name
>   *
>   * .. code-block:: c
>   *
>   *     FIXTURE_SETUP(fixture_name) { implementation }
>   *
>   * Populates the required "setup" function for a fixture.  An instance of the
>   * datatype defined with FIXTURE_DATA() will be exposed as *self* for the
>   * implementation.
>   *
>   * ASSERT_* are valid for use in this context and will prempt the execution
>   * of any dependent fixture tests.
>   *
>   * A bare "return;" statement may be used to return early.
>   */
>  #define FIXTURE_SETUP(fixture_name) \
>  	void fixture_name##_setup( \
>  		struct __test_metadata __attribute__((unused)) *_metadata, \
>  		FIXTURE_DATA(fixture_name) __attribute__((unused)) *self, \
>  		const FIXTURE_VARIANT(fixture_name) \
>  			__attribute__((unused)) *variant)
>  
>  /**
> - * FIXTURE_TEARDOWN(fixture_name)
> + * FIXTURE_TEARDOWN()
>   * *_metadata* is included so that EXPECT_* and ASSERT_* work correctly.
>   *
>   * @fixture_name: fixture name
>   *
>   * .. code-block:: c
>   *
>   *     FIXTURE_TEARDOWN(fixture_name) { implementation }
>   *
>   * Populates the required "teardown" function for a fixture.  An instance of the
>   * datatype defined with FIXTURE_DATA() will be exposed as *self* for the
>   * implementation to clean up.
>   *
>   * A bare "return;" statement may be used to return early.
>   */
>  #define FIXTURE_TEARDOWN(fixture_name) \
>  	void fixture_name##_teardown( \
>  		struct __test_metadata __attribute__((unused)) *_metadata, \
>  		FIXTURE_DATA(fixture_name) __attribute__((unused)) *self)
>  
>  /**
> - * FIXTURE_VARIANT(fixture_name) - Optionally called once per fixture
> + * FIXTURE_VARIANT() - Optionally called once per fixture
>   * to declare fixture variant
>   *
>   * @fixture_name: fixture name
>   *
>   * .. code-block:: c
>   *
>   *     FIXTURE_VARIANT(fixture_name) {
>   *       type property1;
>   *       ...
>   *     };
>   *
>   * Defines type of constant parameters provided to FIXTURE_SETUP() and TEST_F()
>   * as *variant*. Variants allow the same tests to be run with different
>   * arguments.
>   */
>  #define FIXTURE_VARIANT(fixture_name) struct _fixture_variant_##fixture_name
>  
>  /**
> - * FIXTURE_VARIANT_ADD(fixture_name, variant_name) - Called once per fixture
> + * FIXTURE_VARIANT_ADD() - Called once per fixture
>   * variant to setup and register the data
>   *
>   * @fixture_name: fixture name
>   * @variant_name: name of the parameter set
>   *
>   * .. code-block:: c
>   *
>   *     FIXTURE_VARIANT_ADD(fixture_name, variant_name) {
>   *       .property1 = val1,
>   *       ...
>   *     };
>   *
>   * Defines a variant of the test fixture, provided to FIXTURE_SETUP() and
>   * TEST_F() as *variant*. Tests of each fixture will be run once for each
>   * variant.
>   */
>  #define FIXTURE_VARIANT_ADD(fixture_name, variant_name) \
>  	extern FIXTURE_VARIANT(fixture_name) \
>  		_##fixture_name##_##variant_name##_variant; \
>  	static struct __fixture_variant_metadata \
>  		_##fixture_name##_##variant_name##_object = \
>  		{ .name = #variant_name, \
>  		  .data = &_##fixture_name##_##variant_name##_variant}; \
>  	static void __attribute__((constructor)) \
>  		_register_##fixture_name##_##variant_name(void) \
>  	{ \
>  		__register_fixture_variant(&_##fixture_name##_fixture_object, \
>  			&_##fixture_name##_##variant_name##_object);	\
>  	} \
>  	FIXTURE_VARIANT(fixture_name) \
>  		_##fixture_name##_##variant_name##_variant =
>  
>  /**
> - * TEST_F(fixture_name, test_name) - Emits test registration and helpers for
> + * TEST_F() - Emits test registration and helpers for
>   * fixture-based test cases
>   *
>   * @fixture_name: fixture name
>   * @test_name: test name
>   *
>   * .. code-block:: c
>   *
>   *     TEST_F(fixture, name) { implementation }
>   *
>   * Defines a test that depends on a fixture (e.g., is part of a test case).
>   * Very similar to TEST() except that *self* is the setup instance of fixture's
>   * datatype exposed for use by the implementation.
>   *
>   * Warning: use of ASSERT_* here will skip TEARDOWN.
>   */
>  /* TODO(wad) register fixtures on dedicated test lists. */
>  #define TEST_F(fixture_name, test_name) \
>  	__TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEOUT_DEFAULT)
>  
>  #define TEST_F_SIGNAL(fixture_name, test_name, signal) \
>  	__TEST_F_IMPL(fixture_name, test_name, signal, TEST_TIMEOUT_DEFAULT)
>  
>  #define TEST_F_TIMEOUT(fixture_name, test_name, timeout) \
>  	__TEST_F_IMPL(fixture_name, test_name, -1, timeout)
>  
>  #define __TEST_F_IMPL(fixture_name, test_name, signal, tmout) \
>  	static void fixture_name##_##test_name( \
>  		struct __test_metadata *_metadata, \
>  		FIXTURE_DATA(fixture_name) *self, \
>  		const FIXTURE_VARIANT(fixture_name) *variant); \
>  	static inline void wrapper_##fixture_name##_##test_name( \
>  		struct __test_metadata *_metadata, \
> -- 
> 2.28.0
> 

-- 
Kees Cook
