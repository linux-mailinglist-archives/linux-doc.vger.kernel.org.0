Return-Path: <linux-doc+bounces-11548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517E8734E0
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 11:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE969B29EC8
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 10:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B9C60DE7;
	Wed,  6 Mar 2024 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YsHkgbg+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC9460DD4
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721630; cv=none; b=Se1hplrTCBHcNpn/D0VfXIa9ZCD8eXj7T8hu/BthpNIZ9jGJqCv7mtX2tA+RcrtToPB1Z64cf7q1vn/5Ydy2AoBs+u1tazz0L2p0LckaPchHRSoQuLzxxsDjfYn8lcjcqhqBqlNmEZcv8BpTJYqbReWI7KrVWaL/DBM5aNQwbsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721630; c=relaxed/simple;
	bh=1sqViaK8zms8lEsbdD14AiqUVOaVq9kcAdx3Wu9HgIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUZtFXr/rvJXaOeIAjuO2ZB5brtM4scU5ONk6+H27SBOFP5tbz/QriYI0s9tkKBxjereO30nGg+dgUgUehxTgaYJlpK2MAE3F4b/8iV1etsp8r5ecotDOFj2OKY4TuX0AMahnH58lT8b/wjZQqPc0DPp6V7pZu1SxtOfwLn0LDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YsHkgbg+; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4727b9d7b1fso1079161137.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2024 02:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709721626; x=1710326426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Sjwo5RJIhXHjzbNaOpot87oyRxHjUpXY9VVPgdS9wg=;
        b=YsHkgbg+wWAjPzQK/uvjeTsaNeZEDehvPXeoOUH1g/bycU/l5e5Dt3+bne1ePQVBoV
         Ei9mTpn6M6Qf8I1QcFoX2nV8pXqvi77tMt910VF8tWGC9Ln/PRC1Z3R5au31ROgWTBZC
         RK7xnl4vU00Xcc05Gld6gXCTHg4Yi/sFyifpXxx8AwY8Q9zRK0KNjTfu8YTT5Ct4ni1a
         gAZNzTp4a2TGxsp7P0ONLQfTc6YIL8jhdiO3gNwmc2NT2AjHd+JVDOVqvA7sdyta7Pzj
         NzDJpZ1l2/uVT6uW/BLKEUOterykIbF2yAEJhuAjyHEcNIHxwgheIFNHdE6KNiYNL0BZ
         6efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709721626; x=1710326426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sjwo5RJIhXHjzbNaOpot87oyRxHjUpXY9VVPgdS9wg=;
        b=iEq1sRUwylSW+471FLGiqK/AZxo3Sux/jaPXa568kG0WlhU/JgMfUQYOW0OUWjlOAt
         tzUxR3sSDFZFKIfm5ZW+sUUBf7qYGoXUhdric1YnkUKyEiKijuEP83uKb8N6zFSCSHK2
         NJroptxjCkcDkwOGTWQrRhQ2ARRBJJW1ZvVQtOfe/EFZ9Tad0g0GiSkozxm/ujWlv3jl
         Pz3iUYUxKpR6jIepuRq2IPp46FQ7w1a2W08E0CiomPEuODatxhoIyKK0cwgdDTuKctxE
         cVg14B2Ue5VGNfIP3V8GQzhvGdbtnCh4Jc7eq6JMG2Qpmq+Hjh+gj+oST5x0NJIppomT
         /Dfg==
X-Forwarded-Encrypted: i=1; AJvYcCUln1TNkm5jNRX5s4Fy3K2mLebOIiNqbUW0loIDJiL5KHdz6vHShxWFHh+CF9TUsEQtu/m8G+TOtqID63JkBSv2yWVf+k5OxF0o
X-Gm-Message-State: AOJu0YzEtSdvhOVsqoiFA3Q2y9b0dbsdu+Lw/SRFvQDMTFsd5RbOzDtk
	Y+JeNEVNs5JqHR6qXPWKMCkhksfZGPSg48hFioxd/Zft5s/MNulYmFQ9O5fV4EOSXIw8NNcsxGT
	6oJ9spEIZjg0cDaDcirIOgxN3REuEOYmXOZ+3nA==
X-Google-Smtp-Source: AGHT+IGduBh9Are1m4Dmd/r7BVYdWm4z5lzqyISQNPxOmYqfTtHc3lEK6Gv4++jCDQHK3IyEZutr6O/iZppSVzwzGQg=
X-Received: by 2002:a05:6102:4405:b0:472:ec73:9bf5 with SMTP id
 df5-20020a056102440500b00472ec739bf5mr2073706vsb.30.1709721624867; Wed, 06
 Mar 2024 02:40:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305101745.213933-1-balint.dobszay@arm.com>
In-Reply-To: <20240305101745.213933-1-balint.dobszay@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 6 Mar 2024 16:10:13 +0530
Message-ID: <CAFA6WYPNV5F3h=naCtg=fYr8zfB3rho+G1B6-rggLe_PkqvgnQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] TEE driver for Trusted Services
To: Balint Dobszay <balint.dobszay@arm.com>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jens.wiklander@linaro.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Balint,

On Tue, 5 Mar 2024 at 15:48, Balint Dobszay <balint.dobszay@arm.com> wrote:
>
> This series introduces a TEE driver for Trusted Services [1].
>
> Trusted Services is a TrustedFirmware.org project that provides a
> framework for developing and deploying device Root of Trust services in
> FF-A [2] Secure Partitions. The project hosts the reference
> implementation of Arm Platform Security Architecture [3] for Arm
> A-profile devices.
>
> The FF-A Secure Partitions are accessible through the FF-A driver in
> Linux. However, the FF-A driver doesn't have a user space interface so
> user space clients currently cannot access Trusted Services. The goal of
> this TEE driver is to bridge this gap and make Trusted Services
> functionality accessible from user space.
>
> Changelog:
> v2[6] -> v3:
>   - Add patch "tee: Refactor TEE subsystem header files" from Sumit
>   - Remove unnecessary includes from core.c
>   - Remove the mutex from "struct ts_context_data" since the same
>     mechanism could be implemented by reusing the XArray's internal lock
>   - Rename tee_shm_pool_op_*_helper functions as suggested by Sumit
>   - Replace pr_* with dev_* as previously suggested by Krzysztof
>

I will also suggest you to add a maintainer's entry for this new
Trusted Services TEE driver.

-Sumit

> v1[5] -> v2:
>   - Refactor session handling to use XArray instead of IDR and linked
>     list (the linked list was redundant as pointed out by Jens, and IDR
>     is now deprecated in favor of XArray)
>   - Refactor tstee_probe() to not call tee_device_unregister() before
>     calling tee_device_register()
>   - Address comments from Krzysztof and Jens
>   - Address documentation comments from Randy
>   - Use module_ffa_driver() macro instead of separate module init / exit
>     functions
>   - Reformat max line length 100 -> 80
>
> RFC[4] -> v1:
>   - Add patch for moving pool_op helper functions to the TEE subsystem,
>     as suggested by Jens
>   - Address comments from Sumit, add patch for documentation
>
> [1] https://www.trustedfirmware.org/projects/trusted-services/
> [2] https://developer.arm.com/documentation/den0077/
> [3] https://www.arm.com/architecture/security-features/platform-security
> [4] https://lore.kernel.org/linux-arm-kernel/20230927152145.111777-1-balint.dobszay@arm.com/
> [5] https://lore.kernel.org/lkml/20240213145239.379875-1-balint.dobszay@arm.com/
> [6] https://lore.kernel.org/lkml/20240223095133.109046-1-balint.dobszay@arm.com/
>
>
> Balint Dobszay (3):
>   tee: optee: Move pool_op helper functions
>   tee: tstee: Add Trusted Services TEE driver
>   Documentation: tee: Add TS-TEE driver
>
> Sumit Garg (1):
>   tee: Refactor TEE subsystem header files
>
>  Documentation/tee/index.rst         |   1 +
>  Documentation/tee/ts-tee.rst        |  71 ++++
>  MAINTAINERS                         |   1 +
>  drivers/tee/Kconfig                 |   1 +
>  drivers/tee/Makefile                |   1 +
>  drivers/tee/amdtee/amdtee_private.h |   2 +-
>  drivers/tee/amdtee/call.c           |   2 +-
>  drivers/tee/amdtee/core.c           |   3 +-
>  drivers/tee/amdtee/shm_pool.c       |   2 +-
>  drivers/tee/optee/call.c            |   2 +-
>  drivers/tee/optee/core.c            |  66 +---
>  drivers/tee/optee/device.c          |   2 +-
>  drivers/tee/optee/ffa_abi.c         |   8 +-
>  drivers/tee/optee/notif.c           |   2 +-
>  drivers/tee/optee/optee_private.h   |  14 +-
>  drivers/tee/optee/rpc.c             |   2 +-
>  drivers/tee/optee/smc_abi.c         |  11 +-
>  drivers/tee/tee_core.c              |   2 +-
>  drivers/tee/tee_private.h           |  35 --
>  drivers/tee/tee_shm.c               |  66 +++-
>  drivers/tee/tee_shm_pool.c          |   2 +-
>  drivers/tee/tstee/Kconfig           |  11 +
>  drivers/tee/tstee/Makefile          |   3 +
>  drivers/tee/tstee/core.c            | 482 ++++++++++++++++++++++++++++
>  drivers/tee/tstee/tstee_private.h   |  92 ++++++
>  include/linux/tee_core.h            | 306 ++++++++++++++++++
>  include/linux/tee_drv.h             | 285 ++--------------
>  include/uapi/linux/tee.h            |   1 +
>  28 files changed, 1087 insertions(+), 389 deletions(-)
>  create mode 100644 Documentation/tee/ts-tee.rst
>  create mode 100644 drivers/tee/tstee/Kconfig
>  create mode 100644 drivers/tee/tstee/Makefile
>  create mode 100644 drivers/tee/tstee/core.c
>  create mode 100644 drivers/tee/tstee/tstee_private.h
>  create mode 100644 include/linux/tee_core.h
>
> --
> 2.34.1
>

