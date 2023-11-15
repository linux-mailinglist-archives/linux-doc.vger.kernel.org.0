Return-Path: <linux-doc+bounces-1655-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5987D7DFD35
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 00:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ADDA1C20F83
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 23:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA8B224D1;
	Thu,  2 Nov 2023 23:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ICZrtpk2"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E63E224CA;
	Thu,  2 Nov 2023 23:12:02 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 17194197;
	Thu,  2 Nov 2023 16:11:59 -0700 (PDT)
Received: from [10.137.106.151] (unknown [131.107.159.23])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4D22220B74C1;
	Thu,  2 Nov 2023 16:11:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4D22220B74C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1698966718;
	bh=sN/Mi76Mk3NmyPbtaF7zfyETOmjtDtZDxeZhp7Ju7YM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ICZrtpk2pjn0h7boORoZutOlTmaL7xZpFUzWC2vlIp2RQnmeqzZn60bjXDty3++Py
	 g83lnITy3AoPGqfS3IA9KbAKi63F6DMpoSJDa9mzxKM6+qQ9X7VQxxTTsuKdrf9F4I
	 raKYGcAXtGGLsMJ/W7Q6U9XPb2IrtVDhMZXj+vz8=
Message-ID: <8d4673ce-e5cf-4c70-971a-b9d0a6cdcbc9@linux.microsoft.com>
Date: Thu, 2 Nov 2023 16:11:58 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v11 18/19] ipe: kunit test for parser
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>, corbet@lwn.net, zohar@linux.ibm.com,
 jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org,
 axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org,
 roberto.sassu@huawei.com, linux-kernel@vger.kernel.org,
 Deven Bowers <deven.desai@linux.microsoft.com>
References: <1696457386-3010-19-git-send-email-wufan@linux.microsoft.com>
 <88259677752389b350614857e6003b8c.paul@paul-moore.com>
From: Fan Wu <wufan@linux.microsoft.com>
In-Reply-To: <88259677752389b350614857e6003b8c.paul@paul-moore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/23/2023 8:52 PM, Paul Moore wrote:
> On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
>>
>> Add various happy/unhappy unit tests for both IPE's parser.
> 
> I'm going to suggest: "... for IPE's policy parser."
Yeah this sounds more precise.
> 
> Also, aside from the policy parser tests, are there any other IPE
> functional tests?  We do have a testing guideline for new LSM
> submissions:
> 
>   "New LSMs must be accompanied by a test suite to verify basic
>    functionality and help identify regressions. The test suite
>    must be publicly available without download restrictions
>    requiring accounts, subscriptions, etc. Test coverage does
>    not need to reach a specific percentage, but core functionality
>    and any user interfaces should be well covered by the test
>    suite. Maintaining the test suite in a public git repository is
>    preferable over tarball snapshots. Integrating the test suite
>    with existing automated Linux kernel testing services is
>    encouraged."
> 
> https://github.com/LinuxSecurityModule/kernel/blob/main/README.md#new-lsm-guidelines
>
Yes we do have a test suite. I will add it in the next version.
-Fan

>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
>> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
>> ---
>> v1-v6:
>>    + Not present
>>
>> v7:
>>    Introduced
>>
>> v8:
>>    + Remove the kunit tests with respect to the fsverity digest, as these
>>      require significant changes to work with the new method of acquiring
>>      the digest at runtime.
>>
>> v9:
>>    + Remove the kunit tests related to ipe_context
>>
>> v10:
>>    + No changes
>>
>> v11:
>>    + No changes
>> ---
>>   security/ipe/Kconfig        |  17 +++
>>   security/ipe/Makefile       |   3 +
>>   security/ipe/policy_tests.c | 294 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 314 insertions(+)
>>   create mode 100644 security/ipe/policy_tests.c
> 
> --
> paul-moore.com

