Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB7359C75A
	for <lists+linux-doc@lfdr.de>; Mon, 22 Aug 2022 20:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237869AbiHVSy3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Aug 2022 14:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235783AbiHVSyL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 14:54:11 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31311CFFB;
        Mon, 22 Aug 2022 11:53:31 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id gb36so23030532ejc.10;
        Mon, 22 Aug 2022 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=unpDgp0GN+36aPx7b7wAqjDgWTMftsZDnqdX612zzIo=;
        b=f/jScuuazjc+r8t7rQA6ORn6g+H8W5l0jGDaPdxaJlmffeWemDYKW+TE7PiyRZgqet
         rOtOB8utpOWfEyCY14FJRMFNCmgO3IQrq07Art1BmFBG2AzqefvrwPjxob5IC6pCEzkL
         51wr1lVUmmi8EKh+jCDbr1wtMkD4TZyKVYcDCANuI58Vs+c4srJEu9lnhPi0hq3VU690
         Z/HYM+XcOZ7YCcwqDqywp4YjCgWZi2ah1RgDaCjmPserCWVGReluIgD9kpmTbiFdsA8e
         llr7VSe/Z5Cr+4AbTa1BLRnch8r4FqYaiQRfnlepQGuXx1EUt9VSfpV0ifvAJSTyF35I
         a1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=unpDgp0GN+36aPx7b7wAqjDgWTMftsZDnqdX612zzIo=;
        b=n0ablVI66Oj069OnCP/+MGjyYfE//8C/zcQIHxLmrKr482PcfuqRMNVNpLRbmKg0hL
         Lvq2L8N2fUlXjZt0QZlMesaurpEJtSCNJWw5kij+9c0nZ/oO5F/ljz2PW3z+nOw3mkTa
         l0tEslM8pZQjzWPdatB0xJIaYtkibA3UXmkx4t6zmirORD8bL/VfThrcHgLLALhQGvnU
         NbBmVH84Y3fG0MKDCva4qtV2dBTq9sVchW7O6alGjY1s+2Ao4YvrbFdKs9SJfIQ1J2Bp
         5JoxE9SMT+7LsCk978By/dnObujuEnrCQh4s1khBI1h2CoDPFp90bNgny88EFEVBEXLY
         +4fA==
X-Gm-Message-State: ACgBeo3co5ZDvQrGsYpPcEG/6dcheB73ZwYYAZLUjDkk+TrWV3xoZPlM
        9l0TnzORa2QOECJY85o3RVg=
X-Google-Smtp-Source: AA6agR4RasncWSA6NEW1Qj6B8xhUiktERFitqXfNA48bawadSL2enIBBvT23SMmKTghITEdoKrYIzg==
X-Received: by 2002:a17:906:8b81:b0:733:183b:988e with SMTP id nr1-20020a1709068b8100b00733183b988emr13782883ejc.457.1661194410349;
        Mon, 22 Aug 2022 11:53:30 -0700 (PDT)
Received: from nuc ([2a02:168:633b:1:1e69:7aff:fe05:97e6])
        by smtp.gmail.com with ESMTPSA id e4-20020a056402088400b0043cb1a83c9fsm119175edy.71.2022.08.22.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 11:53:29 -0700 (PDT)
Date:   Mon, 22 Aug 2022 20:53:27 +0200
From:   =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To:     Xiu Jianfeng <xiujianfeng@huawei.com>
Cc:     mic@digikod.net, paul@paul-moore.com, jmorris@namei.org,
        serge@hallyn.com, shuah@kernel.org, corbet@lwn.net,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH -next 3/5] landlock/selftests: add selftests for chmod
 and chown
Message-ID: <YwPQpz0lV5CVBVeK@nuc>
References: <20220822114701.26975-1-xiujianfeng@huawei.com>
 <20220822114701.26975-4-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822114701.26975-4-xiujianfeng@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 22, 2022 at 07:46:59PM +0800, Xiu Jianfeng wrote:
> Add the following simple testcases:
> 1. chmod/fchmod: remove S_IWUSR and restore S_IWUSR with or without
> restriction.
> 2. chown/fchown: set original uid and gid with or without restriction,
> because chown needs CAP_CHOWN and testcase framework don't have this
> capability, setting original uid and gid is ok to cover landlock
> function.
>
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> ---
>  tools/testing/selftests/landlock/fs_test.c | 228 +++++++++++++++++++++
>  1 file changed, 228 insertions(+)
>
> diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
> index 5b55b93b5570..f47b4ccd2b26 100644
> --- a/tools/testing/selftests/landlock/fs_test.c
> +++ b/tools/testing/selftests/landlock/fs_test.c
> @@ -59,6 +59,9 @@ static const char file2_s2d3[] = TMP_DIR "/s2d1/s2d2/s2d3/f2";
>
>  static const char dir_s3d1[] = TMP_DIR "/s3d1";
>  static const char file1_s3d1[] = TMP_DIR "/s3d1/f1";
> +static const char file2_s3d1[] = TMP_DIR "/s3d1/f2";
> +static const char file3_s3d1[] = TMP_DIR "/s3d1/f3";
> +
>  /* dir_s3d2 is a mount point. */
>  static const char dir_s3d2[] = TMP_DIR "/s3d1/s3d2";
>  static const char dir_s3d3[] = TMP_DIR "/s3d1/s3d2/s3d3";
> @@ -211,6 +214,8 @@ static void create_layout1(struct __test_metadata *const _metadata)
>  	create_file(_metadata, file2_s2d3);
>
>  	create_file(_metadata, file1_s3d1);
> +	create_file(_metadata, file2_s3d1);
> +	create_file(_metadata, file3_s3d1);
>  	create_directory(_metadata, dir_s3d2);
>  	set_cap(_metadata, CAP_SYS_ADMIN);
>  	ASSERT_EQ(0, mount("tmp", dir_s3d2, "tmpfs", 0, "size=4m,mode=700"));
> @@ -234,6 +239,8 @@ static void remove_layout1(struct __test_metadata *const _metadata)
>  	EXPECT_EQ(0, remove_path(file1_s2d1));
>
>  	EXPECT_EQ(0, remove_path(file1_s3d1));
> +	EXPECT_EQ(0, remove_path(file2_s3d1));
> +	EXPECT_EQ(0, remove_path(file3_s3d1));
>  	EXPECT_EQ(0, remove_path(dir_s3d3));
>  	set_cap(_metadata, CAP_SYS_ADMIN);
>  	umount(dir_s3d2);
> @@ -3272,6 +3279,227 @@ TEST_F_FORK(layout1, truncate)
>  	EXPECT_EQ(0, test_creat(file_in_dir_w));
>  }
>
> +static int test_chmod(const char *path)

Nitpicks:
 - const char *const path
 - short documentation? :)

> +{
> +	int ret;
> +	struct stat st;
> +	mode_t mode;
> +
> +	ret = stat(path, &st);
> +	if (ret < 0)
> +		return errno;
> +	/* save original mode in order to restore */
> +	mode = st.st_mode & 0777;
> +	/* remove S_IWUSR */
> +	ret = chmod(path, mode & ~0200);
> +	if (ret < 0)
> +		return errno;
> +	ret = stat(path, &st);
> +	if (ret < 0)
> +		return errno;
> +	/* check if still has S_IWUSR */
> +	if (st.st_mode & 0200)
> +		return -EFAULT;
> +	/* restore the original mode */
> +	ret = chmod(path, mode);
> +	if (ret < 0)
> +		return errno;
> +	return 0;
> +}

I would argue this can be simpler, with the following reasoning:

 - Does the file have the right mode after chmod()?

   I claim that fs_test should care only about the question of whether
   EACCES is returned or not. If fs_test were to also check for the
   side effects of these operations, it would eventually contain tests
   for the full file system API, not just for Landlock. That seems out
   of scope :)

 - Undoing the chmod() operation

   I'm not sure whether it's worth the effort to restore the exact
   state before that function returns. As long as the flags suffice to
   remove the test directory at the end, it probably doesn't matter
   much what exact mode they have?

I think this could just be

  if (chmod(path, mode) < 0)
          return errno;
  return 0

and it would be a bit simpler to understand :)

The same argument applies also to the other test_...() functions.

> +static int test_fchmod(const char *path)

I initially took the same approach for test_ftruncate() but eventually
settled on using an approach where the file is open()ed before
restricting the thread with Landlock. This eliminates the potential
confusion where test_ftruncate() returns an error but the caller can't
distinguish whether the error is from open() or from ftruncate(). It
also makes fchmod testable even in scenarios where the file cannot be
opened because of missing Landlock rights.

> +{
> +	int ret, fd;
> +	struct stat st;
> +	mode_t mode;
> +
> +	ret = stat(path, &st);
> +	if (ret < 0)
> +		return errno;
> +	/* save original mode in order to restore */
> +	mode = st.st_mode & 0777;
> +
> +	fd = openat(AT_FDCWD, path, O_RDWR | O_CLOEXEC);
> +	if (fd < 0)
> +		return errno;
> +	/* remove S_IWUSR */
> +	ret = fchmod(fd, mode & ~0200);
> +	if (ret < 0)
> +		goto err;
> +	ret = stat(path, &st);
> +	if (ret < 0)
> +		goto err;
> +	/* check if still has S_IWUSR */
> +	if (st.st_mode & 0200) {
> +		ret = -1;
> +		errno = -EFAULT;
> +		goto err;
> +	}
> +	/* restore the original mode */
> +	ret = fchmod(fd, mode);
> +err:
> +	if (close(fd) < 0)
> +		return errno;
> +	return ret ? errno : 0;
> +}

> +static int test_chown(const char *path)
> +{
> +	int ret;
> +	struct stat st;
> +
> +	ret = stat(path, &st);
> +	if (ret < 0)
> +		return errno;
> +	/*
> +	 * chown needs CAP_CHOWN to modify uid and/or gid, however
> +	 * there is no such capability when the testcases framework
> +	 * setup, so just chown to original uid/gid, which can also
> +	 * cover the function in landlock.
> +	 */
> +	ret = chown(path, st.st_uid, st.st_gid);
> +	if (ret < 0)
> +		return errno;
> +	return 0;
> +}
> +
> +static int test_fchown(const char *path)
> +{
> +	int ret, fd;
> +	struct stat st;
> +
> +	ret = stat(path, &st);
> +	if (ret < 0)
> +		return errno;
> +	fd = openat(AT_FDCWD, path, O_RDWR | O_CLOEXEC);
> +	if (fd < 0)
> +		return errno;
> +	/*
> +	 * fchown needs CAP_CHOWN to modify uid and/or gid, however
> +	 * there is no such capability when the testcases framework
> +	 * setup, so just fchown to original uid/gid, which can also
> +	 * cover the function in landlock.
> +	 */
> +	ret = fchown(fd, st.st_uid, st.st_gid);
> +	if (close(fd) < 0)
> +		return errno;
> +	return ret ? errno : 0;
> +}
> +
> +TEST_F_FORK(layout1, unhandled_chmod)
> +{
> +	const struct rule rules[] = {
> +		{
> +			.path = file2_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE,
> +		},
> +		{
> +			.path = file3_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE,
> +		},
> +		{},
> +	};
> +	const int ruleset_fd =
> +		create_ruleset(_metadata, ACCESS_RW, rules);
> +
> +	ASSERT_LE(0, ruleset_fd);
> +	enforce_ruleset(_metadata, ruleset_fd);
> +	ASSERT_EQ(0, close(ruleset_fd));
> +
> +	ASSERT_EQ(0, test_chmod(file2_s3d1));
> +	ASSERT_EQ(0, test_fchmod(file2_s3d1));
> +	ASSERT_EQ(0, test_chmod(file3_s3d1));
> +	ASSERT_EQ(0, test_chmod(dir_s3d1));

*optional* because the existing tests are already inconsistent about it

These four ASSERT_EQ() calls are independent scenarios and could be
done with EXPECT_EQ(), which would be more in line with the approach
that this test framework takes. (Same for the other tests below)

Compare previous discussion at:
https://lore.kernel.org/all/Yvd3+fy+mDBop+YA@nuc/

> +}
> +
> +TEST_F_FORK(layout1, chmod)
> +{
> +	const struct rule rules[] = {
> +		{
> +			.path = file2_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE |
> +				  LANDLOCK_ACCESS_FS_CHMOD,
> +		},
> +		{
> +			.path = file3_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE,
> +		},
> +		{},
> +	};
> +	const int ruleset_fd =
> +		create_ruleset(_metadata, ACCESS_RW | LANDLOCK_ACCESS_FS_CHMOD, rules);
> +
> +	ASSERT_LE(0, ruleset_fd);
> +	enforce_ruleset(_metadata, ruleset_fd);
> +	ASSERT_EQ(0, close(ruleset_fd));
> +
> +	ASSERT_EQ(0, test_chmod(file2_s3d1));
> +	ASSERT_EQ(0, test_fchmod(file2_s3d1));
> +	ASSERT_EQ(EACCES, test_chmod(file3_s3d1));
> +	ASSERT_EQ(EACCES, test_chmod(dir_s3d1));
> +}
> +
> +TEST_F_FORK(layout1, no_chown)

"unhandled_chown" to be consistent with the other one above?

> +{
> +	const struct rule rules[] = {
> +		{
> +			.path = file2_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE,
> +		},
> +		{
> +			.path = file3_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE,
> +		},
> +		{},
> +	};
> +	const int ruleset_fd =
> +		create_ruleset(_metadata, ACCESS_RW, rules);
> +
> +	ASSERT_LE(0, ruleset_fd);
> +	enforce_ruleset(_metadata, ruleset_fd);
> +	ASSERT_EQ(0, close(ruleset_fd));
> +
> +	ASSERT_EQ(0, test_chown(file2_s3d1));
> +	ASSERT_EQ(0, test_fchown(file2_s3d1));
> +	ASSERT_EQ(0, test_chown(file3_s3d1));
> +	ASSERT_EQ(0, test_chown(dir_s3d1));
> +}
> +
> +TEST_F_FORK(layout1, chown)
> +{
> +	const struct rule rules[] = {
> +		{
> +			.path = file2_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE |
> +				  LANDLOCK_ACCESS_FS_CHOWN,

It might be useful to also check a scenario where the chown right is
granted on a directory (and as a consequence, both the directory
itself as well as its contents can be chowned)?  (Same for chmod)

> +		},
> +		{
> +			.path = file3_s3d1,
> +			.access = LANDLOCK_ACCESS_FS_READ_FILE |
> +				  LANDLOCK_ACCESS_FS_WRITE_FILE,
> +		},
> +		{},
> +	};
> +	const int ruleset_fd =
> +		create_ruleset(_metadata, ACCESS_RW | LANDLOCK_ACCESS_FS_CHOWN, rules);
> +
> +	ASSERT_LE(0, ruleset_fd);
> +	enforce_ruleset(_metadata, ruleset_fd);
> +	ASSERT_EQ(0, close(ruleset_fd));
> +
> +	ASSERT_EQ(0, test_chown(file2_s3d1));
> +	ASSERT_EQ(0, test_fchown(file2_s3d1));
> +	ASSERT_EQ(EACCES, test_chown(file3_s3d1));
> +	ASSERT_EQ(EACCES, test_chown(dir_s3d1));
> +}
> +
>  /* clang-format off */
>  FIXTURE(layout1_bind) {};
>  /* clang-format on */
> --
> 2.17.1
>

--
