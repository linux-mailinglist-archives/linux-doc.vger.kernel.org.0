Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6575ABAEE
	for <lists+linux-doc@lfdr.de>; Sat,  3 Sep 2022 00:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiIBWt7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Sep 2022 18:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiIBWt6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 18:49:58 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30EA2F00B
        for <linux-doc@vger.kernel.org>; Fri,  2 Sep 2022 15:49:54 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id l65so3238058pfl.8
        for <linux-doc@vger.kernel.org>; Fri, 02 Sep 2022 15:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=TOEwTeaDYKnckpI0Y0o8xp7WmAIhg+JUBZ+GedO0Bcs=;
        b=U6YuTQ3YGA2rJuhQN2gVA5cKuPIC3AihfsnK0KSVuVbFhFVw15UAbIntKiB5jWtEnC
         eE6N5w3p1oTnTXdwyngNsySqVKp8qXYy2L9VSZHIeyRSfDu2GDX6oiBFJyV8+ZnXze+h
         2/NC3nUuts9cdvUuFc/uhM0vrZY80E8c5/3zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=TOEwTeaDYKnckpI0Y0o8xp7WmAIhg+JUBZ+GedO0Bcs=;
        b=L0Xig/bj5fhBt+2WwHk35whfFhlhG4kYqvP0YIoEBWRMKIvkHj6cJ1vHvyJDFJ0HWx
         rZ9lfn408Q+Shb2symLs3oJi40dcvXf88zzNB4shgpEg/RDSFOtFbkSDtQx9djGwX5T3
         Hx9fP2UjpRaxBthc+YQ8cjFXiCJUDC571tSRmYOj/AG1M+VLKHO755QRtmsv0JIXHeSq
         B+mCbLrRMvjAE2/0lDyxdjxagHsDeF9YjhMq7jWypcBq8tZQblOFP9eJ0zmrHGAR2+tX
         OqYzYWaBcnqXjVEGiAHReKYbLqHpu39+IVoFF4GAJbswa2ciYvV0I1agEtwDJur0ncxF
         jVdw==
X-Gm-Message-State: ACgBeo01Nfq3hpWPI/VSpZhEZoBPscXZsZFvfwNLd9OWmrI18utMcyv5
        k0/gNeeqWt+hIPBaGh4B5sgd1g==
X-Google-Smtp-Source: AA6agR5O16U4bqe7Wvc4GNZtIcJReu7/vP8Gz5pjri/kJToBVgokwwZHLNuogPAgA4jM8OIsJKZHwg==
X-Received: by 2002:a05:6a00:1c46:b0:538:2b27:dd7f with SMTP id s6-20020a056a001c4600b005382b27dd7fmr27872658pfw.30.1662158994274;
        Fri, 02 Sep 2022 15:49:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q8-20020a17090311c800b0015e8d4eb1f7sm2168722plh.65.2022.09.02.15.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 15:49:53 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Len Baker <len.baker@gmx.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Francis Laniel <laniel_francis@privacyrequired.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v3] string: Introduce strtomem() and strtomem_pad()
Date:   Fri,  2 Sep 2022 15:49:51 -0700
Message-Id: <20220902224951.2625138-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11205; h=from:subject; bh=8yoCfv+YdvttXETv9yPW1LGIlZeSHfxfhxnvV3BeUwc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjEoiPCv0x9qfF/+B9b0XCPfYNPVmUBHlCSGrrHylZ nXywOgCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYxKIjwAKCRCJcvTf3G3AJtGpD/ 47tVDfQHfSaTkzgJJH714QO8ZV6PU+EZhZn9TJiXL3CMhWqBwOYNPc+rsPXwsEjGjHSsulKYjgkTxe T0nXlXtnp6CgojefanWgKdM4WE17RECmQKyQI8cLUF8fdj58CyJBHGfV8NpZBu3BeXV5NKJb4IYQ07 Uon3TfRq06WkZAizxk7Tf5pej/62XQdPyNZbuCzHTPB3EaiURzw+se4dii3OodHKMbxmyvpv7X6vw+ PCom8JRERXUm/5D5VMslNb0z8cIvE01GmAG81umaQJPh5SA+8E4YRCkOa3TetBR6qNqxa7IQ06131C DNFu21qS6Pb76VOD4mEOI1JJCXSsTULhkRmhKunEeQPZv5MhkaNcBWRvsuGNG+rRMC3nZS1k5ihZhw qz7qcbV8j3axIRPUlKV23JOuF31da1OnFXjJbHm+ANeRsrz+QpJSPBr0LPtEvsUDGLChDq8209kLVJ DDR5WviGPxDO1UETl2IP1JSVdXvShDYrIyFkOxBwyentEAviiqZnDcATdbolLPLwczYYIYWzqlIK46 26zTMxoqN7urtLEz4I72kkf3NCpjvxKhTDjVPjBXj8mHNcFazXHlZQKS9Gsb1uFtkGraPHYmdiXYUn /liGyIdHJFERcZVtJwNEs0QQ1nLDrXCjhNJJ7ZqkqIFdgKICmWG/QHzUMfRg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

One of the "legitimate" uses of strncpy() is copying a NUL-terminated
string into a fixed-size non-NUL-terminated character array. To avoid
the weaknesses and ambiguity of intent when using strncpy(), provide
replacement functions that explicitly distinguish between trailing
padding and not, and require the destination buffer size be discoverable
by the compiler.

For example:

struct obj {
	int foo;
	char small[4] __nonstring;
	char big[8] __nonstring;
	int bar;
};

struct obj p;

/* This will truncate to 4 chars with no trailing NUL */
strncpy(p.small, "hello", sizeof(p.small));
/* p.small contains 'h', 'e', 'l', 'l' */

/* This will NUL pad to 8 chars. */
strncpy(p.big, "hello", sizeof(p.big));
/* p.big contains 'h', 'e', 'l', 'l', 'o', '\0', '\0', '\0' */

When the "__nonstring" attributes are missing, the intent of the
programmer becomes ambiguous for whether the lack of a trailing NUL
in the p.small copy is a bug. Additionally, it's not clear whether
the trailing padding in the p.big copy is _needed_. Both cases
become unambiguous with:

strtomem(p.small, "hello");
strtomem_pad(p.big, "hello", 0);

See also https://github.com/KSPP/linux/issues/90

Expand the memcpy KUnit tests to include these functions.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v3:
 - fix repeated "be be" (Guenter)
 - fix kern-doc format (Guenter, Bagas)
v2: https://lore.kernel.org/lkml/20220901190952.2229696-1-keescook@chromium.org
v1: https://lore.kernel.org/lkml/20220831230006.1016236-1-keescook@chromium.org
---
 Documentation/process/deprecated.rst | 11 ++++--
 include/linux/fortify-string.h       | 32 +++++++++++++++
 include/linux/string.h               | 43 ++++++++++++++++++++
 lib/memcpy_kunit.c                   | 59 ++++++++++++++++++++++++++--
 4 files changed, 137 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index a6e36d9c3d14..c8fd53a11a20 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -138,17 +138,20 @@ be NUL terminated. This can lead to various linear read overflows and
 other misbehavior due to the missing termination. It also NUL-pads
 the destination buffer if the source contents are shorter than the
 destination buffer size, which may be a needless performance penalty
-for callers using only NUL-terminated strings. The safe replacement is
+for callers using only NUL-terminated strings.
+
+When the destination is required to be NUL-terminated, the replacement is
 strscpy(), though care must be given to any cases where the return value
 of strncpy() was used, since strscpy() does not return a pointer to the
 destination, but rather a count of non-NUL bytes copied (or negative
 errno when it truncates). Any cases still needing NUL-padding should
 instead use strscpy_pad().
 
-If a caller is using non-NUL-terminated strings, strncpy() can
-still be used, but destinations should be marked with the `__nonstring
+If a caller is using non-NUL-terminated strings, strtomem() should be
+used, and the destinations should be marked with the `__nonstring
 <https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html>`_
-attribute to avoid future compiler warnings.
+attribute to avoid future compiler warnings. For cases still needing
+NUL-padding, strtomem_pad() can be used.
 
 strlcpy()
 ---------
diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 3b401fa0f374..8e8c2c87b1d5 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -77,6 +77,38 @@ extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size)
 #define POS	__pass_object_size(1)
 #define POS0	__pass_object_size(0)
 
+/**
+ * strncpy - Copy a string to memory with non-guaranteed NUL padding
+ *
+ * @p: pointer to destination of copy
+ * @q: pointer to NUL-terminated source string to copy
+ * @size: bytes to write at @p
+ *
+ * If strlen(@q) >= @size, the copy of @q will stop after @size bytes,
+ * and @p will NOT be NUL-terminated
+ *
+ * If strlen(@q) < @size, following the copy of @q, trailing NUL bytes
+ * will be written to @p until @size total bytes have been written.
+ *
+ * Do not use this function. While FORTIFY_SOURCE tries to avoid
+ * over-reads of @q, it cannot defend against writing unterminated
+ * results to @p. Using strncpy() remains ambiguous and fragile.
+ * Instead, please choose an alternative, so that the expectation
+ * of @p's contents is unambiguous:
+ *
+ * +--------------------+-----------------+------------+
+ * | @p needs to be:    | padded to @size | not padded |
+ * +====================+=================+============+
+ * |     NUL-terminated | strscpy_pad()   | strscpy()  |
+ * +--------------------+-----------------+------------+
+ * | not NUL-terminated | strtomem_pad()  | strtomem() |
+ * +--------------------+-----------------+------------+
+ *
+ * Note strscpy*()'s differing return values for detecting truncation,
+ * and strtomem*()'s expectation that the destination is marked with
+ * __nonstring when it is a character array.
+ *
+ */
 __FORTIFY_INLINE __diagnose_as(__builtin_strncpy, 1, 2, 3)
 char *strncpy(char * const POS p, const char *q, __kernel_size_t size)
 {
diff --git a/include/linux/string.h b/include/linux/string.h
index 61ec7e4f6311..cf7607b32102 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -260,6 +260,49 @@ static inline const char *kbasename(const char *path)
 void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
 		    int pad);
 
+/**
+ * strtomem_pad - Copy NUL-terminated string to non-NUL-terminated buffer
+ *
+ * @dest: Pointer of destination character array (marked as __nonstring)
+ * @src: Pointer to NUL-terminated string
+ * @pad: Padding character to fill any remaining bytes of @dest after copy
+ *
+ * This is a replacement for strncpy() uses where the destination is not
+ * a NUL-terminated string, but with bounds checking on the source size, and
+ * an explicit padding character. If padding is not required, use strtomem().
+ *
+ * Note that the size of @dest is not an argument, as the length of @dest
+ * must be discoverable by the compiler.
+ */
+#define strtomem_pad(dest, src, pad)	do {				\
+	const size_t _dest_len = __builtin_object_size(dest, 1);	\
+									\
+	BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||		\
+		     _dest_len == (size_t)-1);				\
+	memcpy_and_pad(dest, _dest_len, src, strnlen(src, _dest_len), pad); \
+} while (0)
+
+/**
+ * strtomem - Copy NUL-terminated string to non-NUL-terminated buffer
+ *
+ * @dest: Pointer of destination character array (marked as __nonstring)
+ * @src: Pointer to NUL-terminated string
+ *
+ * This is a replacement for strncpy() uses where the destination is not
+ * a NUL-terminated string, but with bounds checking on the source size, and
+ * without trailing padding. If padding is required, use strtomem_pad().
+ *
+ * Note that the size of @dest is not an argument, as the length of @dest
+ * must be discoverable by the compiler.
+ */
+#define strtomem(dest, src)	do {					\
+	const size_t _dest_len = __builtin_object_size(dest, 1);	\
+									\
+	BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||		\
+		     _dest_len == (size_t)-1);				\
+	memcpy(dest, src, min(_dest_len, strnlen(src, _dest_len)));	\
+} while (0)
+
 /**
  * memset_after - Set a value after a struct member to the end of a struct
  *
diff --git a/lib/memcpy_kunit.c b/lib/memcpy_kunit.c
index 62f8ffcbbaa3..d22fa3838ee9 100644
--- a/lib/memcpy_kunit.c
+++ b/lib/memcpy_kunit.c
@@ -29,9 +29,8 @@ struct some_bytes {
 };
 
 #define check(instance, v) do {	\
-	int i;	\
 	BUILD_BUG_ON(sizeof(instance.data) != 32);	\
-	for (i = 0; i < sizeof(instance.data); i++) {	\
+	for (size_t i = 0; i < sizeof(instance.data); i++) {	\
 		KUNIT_ASSERT_EQ_MSG(test, instance.data[i], v, \
 			"line %d: '%s' not initialized to 0x%02x @ %d (saw 0x%02x)\n", \
 			__LINE__, #instance, v, i, instance.data[i]);	\
@@ -39,9 +38,8 @@ struct some_bytes {
 } while (0)
 
 #define compare(name, one, two) do { \
-	int i; \
 	BUILD_BUG_ON(sizeof(one) != sizeof(two)); \
-	for (i = 0; i < sizeof(one); i++) {	\
+	for (size_t i = 0; i < sizeof(one); i++) {	\
 		KUNIT_EXPECT_EQ_MSG(test, one.data[i], two.data[i], \
 			"line %d: %s.data[%d] (0x%02x) != %s.data[%d] (0x%02x)\n", \
 			__LINE__, #one, i, one.data[i], #two, i, two.data[i]); \
@@ -272,10 +270,63 @@ static void memset_test(struct kunit *test)
 #undef TEST_OP
 }
 
+static void strtomem_test(struct kunit *test)
+{
+	static const char input[] = "hi";
+	static const char truncate[] = "this is too long";
+	struct {
+		unsigned long canary1;
+		unsigned char output[sizeof(unsigned long)] __nonstring;
+		unsigned long canary2;
+	} wrap;
+
+	memset(&wrap, 0xFF, sizeof(wrap));
+	KUNIT_EXPECT_EQ_MSG(test, wrap.canary1, ULONG_MAX,
+			    "bad initial canary value");
+	KUNIT_EXPECT_EQ_MSG(test, wrap.canary2, ULONG_MAX,
+			    "bad initial canary value");
+
+	/* Check unpadded copy leaves surroundings untouched. */
+	strtomem(wrap.output, input);
+	KUNIT_EXPECT_EQ(test, wrap.canary1, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, wrap.output[0], input[0]);
+	KUNIT_EXPECT_EQ(test, wrap.output[1], input[1]);
+	for (size_t i = 2; i < sizeof(wrap.output); i++)
+		KUNIT_EXPECT_EQ(test, wrap.output[i], 0xFF);
+	KUNIT_EXPECT_EQ(test, wrap.canary2, ULONG_MAX);
+
+	/* Check truncated copy leaves surroundings untouched. */
+	memset(&wrap, 0xFF, sizeof(wrap));
+	strtomem(wrap.output, truncate);
+	KUNIT_EXPECT_EQ(test, wrap.canary1, ULONG_MAX);
+	for (size_t i = 0; i < sizeof(wrap.output); i++)
+		KUNIT_EXPECT_EQ(test, wrap.output[i], truncate[i]);
+	KUNIT_EXPECT_EQ(test, wrap.canary2, ULONG_MAX);
+
+	/* Check padded copy leaves only string padded. */
+	memset(&wrap, 0xFF, sizeof(wrap));
+	strtomem_pad(wrap.output, input, 0xAA);
+	KUNIT_EXPECT_EQ(test, wrap.canary1, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, wrap.output[0], input[0]);
+	KUNIT_EXPECT_EQ(test, wrap.output[1], input[1]);
+	for (size_t i = 2; i < sizeof(wrap.output); i++)
+		KUNIT_EXPECT_EQ(test, wrap.output[i], 0xAA);
+	KUNIT_EXPECT_EQ(test, wrap.canary2, ULONG_MAX);
+
+	/* Check truncated padded copy has no padding. */
+	memset(&wrap, 0xFF, sizeof(wrap));
+	strtomem(wrap.output, truncate);
+	KUNIT_EXPECT_EQ(test, wrap.canary1, ULONG_MAX);
+	for (size_t i = 0; i < sizeof(wrap.output); i++)
+		KUNIT_EXPECT_EQ(test, wrap.output[i], truncate[i]);
+	KUNIT_EXPECT_EQ(test, wrap.canary2, ULONG_MAX);
+}
+
 static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE(memset_test),
 	KUNIT_CASE(memcpy_test),
 	KUNIT_CASE(memmove_test),
+	KUNIT_CASE(strtomem_test),
 	{}
 };
 
-- 
2.34.1

