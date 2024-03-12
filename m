Return-Path: <linux-doc+bounces-11967-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D645879316
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 12:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08CB42831BD
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 11:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F5578288;
	Tue, 12 Mar 2024 11:36:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1E920304;
	Tue, 12 Mar 2024 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710243380; cv=none; b=b4Zj/W2hJ9W03jtw95kTKg75f9McQvRQ+9pBz5X5eeeSKNnKtdfPGuWr28LgHjMqdFdffiWZ1aYyhk9N10Zew/xAk95FeETwCENQJtxKX5I329PFSAsyxA0BBarzbH7PQjVXdRFG38DC4txbhRcVRb/tg+untf3eMm2AP6cTmDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710243380; c=relaxed/simple;
	bh=TPg3Td+XLiyE8SiOwEwur+rbcT0GJ58OK6ENOzskB78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BsUZB7vdxKmuXJyU5ANpyD3EWLR+yKykEdEFKjTnhJh9/Cy+lmYkkCNiswBSUgsz66KYpqg7+SIE2zYwYoiImfEbz2JWa1ZslFuoLqVMATk1pDKR8kj1yyL8g7z78fCXqVmIdpPxDM/cKzmab9DvgasHFT6GX/Uwsolr0OqPYd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36FC51007;
	Tue, 12 Mar 2024 04:36:54 -0700 (PDT)
Received: from [10.37.129.2] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 301233F762;
	Tue, 12 Mar 2024 04:36:15 -0700 (PDT)
From: Balint Dobszay <balint.dobszay@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jens.wiklander@linaro.org, corbet@lwn.net, sudeep.holla@arm.com,
 rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Subject: Re: [PATCH v3 0/4] TEE driver for Trusted Services
Date: Tue, 12 Mar 2024 12:36:13 +0100
X-Mailer: MailMate (1.14r5937)
Message-ID: <173F2BEA-50F1-4339-A072-473ED7CC7DC9@arm.com>
In-Reply-To: <CAFA6WYPNV5F3h=naCtg=fYr8zfB3rho+G1B6-rggLe_PkqvgnQ@mail.gmail.com>
References: <20240305101745.213933-1-balint.dobszay@arm.com>
 <CAFA6WYPNV5F3h=naCtg=fYr8zfB3rho+G1B6-rggLe_PkqvgnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

On 6 Mar 2024, at 11:40, Sumit Garg wrote:

> Hi Balint,
>
> On Tue, 5 Mar 2024 at 15:48, Balint Dobszay <balint.dobszay@arm.com> wr=
ote:
>>
>> This series introduces a TEE driver for Trusted Services [1].
>>
>> Trusted Services is a TrustedFirmware.org project that provides a
>> framework for developing and deploying device Root of Trust services i=
n
>> FF-A [2] Secure Partitions. The project hosts the reference
>> implementation of Arm Platform Security Architecture [3] for Arm
>> A-profile devices.
>>
>> The FF-A Secure Partitions are accessible through the FF-A driver in
>> Linux. However, the FF-A driver doesn't have a user space interface so=

>> user space clients currently cannot access Trusted Services. The goal =
of
>> this TEE driver is to bridge this gap and make Trusted Services
>> functionality accessible from user space.
>>
>> Changelog:
>> v2[6] -> v3:
>>   - Add patch "tee: Refactor TEE subsystem header files" from Sumit
>>   - Remove unnecessary includes from core.c
>>   - Remove the mutex from "struct ts_context_data" since the same
>>     mechanism could be implemented by reusing the XArray's internal lo=
ck
>>   - Rename tee_shm_pool_op_*_helper functions as suggested by Sumit
>>   - Replace pr_* with dev_* as previously suggested by Krzysztof
>>
>
> I will also suggest you to add a maintainer's entry for this new
> Trusted Services TEE driver.

Sure, will do. I plan to post v4 next week.

Regards,
Balint

>> v1[5] -> v2:
>>   - Refactor session handling to use XArray instead of IDR and linked
>>     list (the linked list was redundant as pointed out by Jens, and ID=
R
>>     is now deprecated in favor of XArray)
>>   - Refactor tstee_probe() to not call tee_device_unregister() before
>>     calling tee_device_register()
>>   - Address comments from Krzysztof and Jens
>>   - Address documentation comments from Randy
>>   - Use module_ffa_driver() macro instead of separate module init / ex=
it
>>     functions
>>   - Reformat max line length 100 -> 80
>>
>> RFC[4] -> v1:
>>   - Add patch for moving pool_op helper functions to the TEE subsystem=
,
>>     as suggested by Jens
>>   - Address comments from Sumit, add patch for documentation
>>
>> [1] https://www.trustedfirmware.org/projects/trusted-services/
>> [2] https://developer.arm.com/documentation/den0077/
>> [3] https://www.arm.com/architecture/security-features/platform-securi=
ty
>> [4] https://lore.kernel.org/linux-arm-kernel/20230927152145.111777-1-b=
alint.dobszay@arm.com/
>> [5] https://lore.kernel.org/lkml/20240213145239.379875-1-balint.dobsza=
y@arm.com/
>> [6] https://lore.kernel.org/lkml/20240223095133.109046-1-balint.dobsza=
y@arm.com/
>>
>>
>> Balint Dobszay (3):
>>   tee: optee: Move pool_op helper functions
>>   tee: tstee: Add Trusted Services TEE driver
>>   Documentation: tee: Add TS-TEE driver
>>
>> Sumit Garg (1):
>>   tee: Refactor TEE subsystem header files
>>
>>  Documentation/tee/index.rst         |   1 +
>>  Documentation/tee/ts-tee.rst        |  71 ++++
>>  MAINTAINERS                         |   1 +
>>  drivers/tee/Kconfig                 |   1 +
>>  drivers/tee/Makefile                |   1 +
>>  drivers/tee/amdtee/amdtee_private.h |   2 +-
>>  drivers/tee/amdtee/call.c           |   2 +-
>>  drivers/tee/amdtee/core.c           |   3 +-
>>  drivers/tee/amdtee/shm_pool.c       |   2 +-
>>  drivers/tee/optee/call.c            |   2 +-
>>  drivers/tee/optee/core.c            |  66 +---
>>  drivers/tee/optee/device.c          |   2 +-
>>  drivers/tee/optee/ffa_abi.c         |   8 +-
>>  drivers/tee/optee/notif.c           |   2 +-
>>  drivers/tee/optee/optee_private.h   |  14 +-
>>  drivers/tee/optee/rpc.c             |   2 +-
>>  drivers/tee/optee/smc_abi.c         |  11 +-
>>  drivers/tee/tee_core.c              |   2 +-
>>  drivers/tee/tee_private.h           |  35 --
>>  drivers/tee/tee_shm.c               |  66 +++-
>>  drivers/tee/tee_shm_pool.c          |   2 +-
>>  drivers/tee/tstee/Kconfig           |  11 +
>>  drivers/tee/tstee/Makefile          |   3 +
>>  drivers/tee/tstee/core.c            | 482 +++++++++++++++++++++++++++=
+
>>  drivers/tee/tstee/tstee_private.h   |  92 ++++++
>>  include/linux/tee_core.h            | 306 ++++++++++++++++++
>>  include/linux/tee_drv.h             | 285 ++--------------
>>  include/uapi/linux/tee.h            |   1 +
>>  28 files changed, 1087 insertions(+), 389 deletions(-)
>>  create mode 100644 Documentation/tee/ts-tee.rst
>>  create mode 100644 drivers/tee/tstee/Kconfig
>>  create mode 100644 drivers/tee/tstee/Makefile
>>  create mode 100644 drivers/tee/tstee/core.c
>>  create mode 100644 drivers/tee/tstee/tstee_private.h
>>  create mode 100644 include/linux/tee_core.h
>>
>> --
>> 2.34.1
>>

