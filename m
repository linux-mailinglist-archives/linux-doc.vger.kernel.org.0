Return-Path: <linux-doc+bounces-14699-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D28ABCC9
	for <lists+linux-doc@lfdr.de>; Sat, 20 Apr 2024 20:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2D21F21194
	for <lists+linux-doc@lfdr.de>; Sat, 20 Apr 2024 18:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBAB2AD33;
	Sat, 20 Apr 2024 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="QOBgIMNu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E14205E00
	for <linux-doc@vger.kernel.org>; Sat, 20 Apr 2024 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713639030; cv=none; b=fkw/pTjvpyPGYa1cRPGDgh5cgOjp8QrNvbqLSeR3a+a+VE36CE5+vUiq6kcCI2R0rMaSBA54+c2K3fZYXbXksMsiTu8CAB7NxAY2/KaBDdJrnIbogU9CRtUB3Q++7Z5ja/S7uT4ZeMDKVtg5P3701XMife2T8838SGI6KISWWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713639030; c=relaxed/simple;
	bh=g28MeYse2mxBCn//Errfp47sv/azT0HsAvDdN8vtTyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8gxwSzyBsJnbDnmnnP52LSJ5bnulk+espTd6cHgYAUL2IZzdmSDCxX1Q0kT2GwQRR53E/o8MmIbfubsWqfPBsX6ybE4Vd3V5ka/pZjOHC98qEpfJkZZlL0M3eDmyPYzGqqxX0eIpeTARWVwBu7THNkhWWHT9X2Nr63NMtGUGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=QOBgIMNu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e3f17c6491so25729695ad.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Apr 2024 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1713639026; x=1714243826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69d0O+5fM8Yt3nBud30EjYozGnnBdHocwTktgDdGO/c=;
        b=QOBgIMNuGTsxfikqoKYAcQVf4qDLQGHNR6hzeD7PrqUus4/Elg7zSJPhFxC08Kg30M
         ZXlxinM40IHiKDVn10tkqyKQ3vwAgzvX5CMT+pAtRflzMWpp+dF5nAjDp+6VKhp7HnEI
         LDfTmCqLAAVrQ8NWkQSuKbA1oKfisygI1KPpoRDt9amE9O183JJ253dCN+uY4bSilJyn
         mHE/0MU7FeQPTwIX1sB1NRUGRZWBmHmdnZ+rDneLYM53iKWsiBZ3mIL+Mzt2tFAUeOI1
         J/w0ut3vLYff+uAfrXKnZDCfA3YNSUhuEwGJlS1M6DkEtgN2UF6llKWQudFJ+vKChv39
         mAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713639026; x=1714243826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69d0O+5fM8Yt3nBud30EjYozGnnBdHocwTktgDdGO/c=;
        b=TIbn2S5HLEzJwx8RFKIfFaT1k5n44OilIoWc6ZrxkFSGX6W7x5BQXvUx4d5ZGOD0Nf
         BVjRrltxlkq76Zns8d+zYx8OoXjK03ToJjl0XC2ZR4MluUx+KzmU/1Iaa2b21OKuc6np
         gViaxhAim7tyQBsZ47pj1gnJB+bZgFouHr3iIDyk456vn6X1CuXnYYVEh9NF8Be4wDWx
         NYBKgs6lkYKizdT5a087op3579BQdbIFx6d8EHH8CV5SozZzhAFrl7TmSy7Nr86X6eFP
         gHRfboOXIzSN4G+zNj/CdUUKtuF0cPMx04TXaIT8mCEL1Xwhxli+OGi3WuNNmBGzXsDT
         DgiA==
X-Forwarded-Encrypted: i=1; AJvYcCUr5KMDQQ94i3sapnAFg8djntRUqdv1/jNW4N6zmmi7/Rj96QELHnf96rsi0DMuyUohWBMiVSnik+YS21RaUW414xaSfbX02E3J
X-Gm-Message-State: AOJu0YzwMfW9xvSbE8X7MLfVQu9nNhLucyGhI0/6cZChLGZfFvgXW3xg
	HHGUkQ6XkGRtBUZy956V6rOJevP/rNxfHw1+UcvMThFAZxf1+Uhk3+ehI0XiTg==
X-Google-Smtp-Source: AGHT+IG7wdpD31V/mV9SZ9Z9bEhieOqV6SqkRO2QWssC+nP2fRjbcc/5NQPLDZMSiwwhJKYxFzsQ8g==
X-Received: by 2002:a17:902:c952:b0:1e2:7356:aa36 with SMTP id i18-20020a170902c95200b001e27356aa36mr7754665pla.42.1713639026179;
        Sat, 20 Apr 2024 11:50:26 -0700 (PDT)
Received: from fedora.. ([2804:14c:71:5fb7::1001])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b001dd578121d4sm5321995plk.204.2024.04.20.11.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 11:50:25 -0700 (PDT)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: rodrigo.siqueira@amd.com,
	airlied@gmail.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	corbet@lwn.net,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Xinhui.Pan@amd.com
Cc: paulormm@ime.usp.br,
	airlied@linux.ie,
	amd-gfx@lists.freedesktop.org,
	andrealmeid@riseup.net,
	davidgow@google.com,
	dlatypov@google.com,
	dri-devel@lists.freedesktop.org,
	harry.wentland@amd.com,
	hersenxs.wu@amd.com,
	isabbasso@riseup.net,
	javierm@redhat.com,
	kunit-dev@googlegroups.com,
	magalilemes00@gmail.com,
	mairacanal@riseup.net,
	mwen@igalia.com,
	nicholas.choi@amd.com,
	sunpeng.li@amd.com,
	tales.aparecida@gmail.com,
	twoerner@gmail.com,
	Joao Paulo Pereira da Silva <jppaulo11@usp.br>,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/4] drm/amd/display: Update Display Core unit tests
Date: Sat, 20 Apr 2024 15:48:15 -0300
Message-ID: <20240420184929.97854-1-jppaulo11@usp.br>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey, I'm interested in contributing for display tests from this patch-set.
I've noticed potential updates related to both refactoring and optimization.
This patch-set applies these suggestions.


[WHY]

1.	The single test suite in the file
	test/kunit/dc/dml/calcs/bw_fixed_test.c, which tests some static
	functions defined in the dc/basics/bpw_fixed.c, is not being run.
	According to kunit documentation
	(https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.html#testing-static-functions),
	there are two strategies for testing
	static functions, but none of them seem to be configured. Additionally,
	it appears that the Config DCE_KUNIT_TEST should be associated with this
	test, since it was introduced in the same patch of the test
	(https://lore.kernel.org/amd-gfx/20240222155811.44096-3-Rodrigo.Siqueira@amd.com/),
	but it is not being used anywhere in the display driver.

2.	Also, according to the documentation, "The display/tests folder replicates
	the folder hierarchy of the display folder". However, note that this test file
	(test/kunit/dc/dml/calcs/bw_fixed_test.c) has a conflicting path with the file
	that is being tested (dc/basics/bw_fixed.c).

3.	Config Names and Helps are a bit misleading and don't follow a strict
	pattern. For example, the config DML_KUNIT_TEST indicates that it is used
	to activate tests for the Display Core Engine, but instead activates tests
	for the Display Core Next. Also, note the different name patterns in
	DML_KUNIT_TEST and AMD_DC_BASICS_KUNIT_TEST.

4.	The test suite dcn21_update_bw_bounding_box_test_suite configures an init
	function that doesn't need to be executed before every test, but only once
	before the suite runs.

5.	There are some not updated info in the Documentation, such as the
	recommended command to run the tests:
	$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
	--kunitconfig=drivers/gpu/drm/amd/display/tests
	(it doesn't work since there is no .kunitconfig in
	drivers/gpu/drm/amd/display/tests)


[HOW]

1. Revise Config names and Help blocks.

2.	Change the path of the test file bw_fixed_test from
	test/kunit/dc/dml/calcs/bw_fixed_test.c to test/kunit/dc/basics/bw_fixed_test.c
	to make it consistent with the Documentation and the other display driver
	tests. Make this same test file run by importing it conditionally in the file
	dc/basics/bw_fixed_test.c.

3.	Turn the test init function of the suite
	dcn21_update_bw_bounding_box_test_suite into a suite init.

4.	Update Documentation

Joao Paulo Pereira da Silva (4):
  drm/amd/display: Refactor AMD display KUnit tests configs
  drm/amd/display/test: Fix kunit test that is not running
  drm/amd/display/test: Optimize kunit test suite
    dml_dcn20_fpu_dcn21_update_bw_bounding_box_test
  Documentation/gpu: Update AMD Display Core Unit Test documentation

 .../gpu/amdgpu/display/display-test.rst       | 20 ++++++------
 drivers/gpu/drm/amd/display/Kconfig           | 31 ++++++-------------
 .../gpu/drm/amd/display/dc/basics/bw_fixed.c  |  3 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
 .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |  2 +-
 .../drm/amd/display/test/kunit/.kunitconfig   |  7 ++---
 .../gpu/drm/amd/display/test/kunit/Makefile   |  4 +--
 .../dc/{dml/calcs => basics}/bw_fixed_test.c  |  0
 .../test/kunit/dc/dml/dcn20/dcn20_fpu_test.c  |  6 ++--
 10 files changed, 32 insertions(+), 45 deletions(-)
 rename drivers/gpu/drm/amd/display/test/kunit/dc/{dml/calcs => basics}/bw_fixed_test.c (100%)

-- 
2.44.0


