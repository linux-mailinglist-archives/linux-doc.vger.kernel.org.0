Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F221F6D691F
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 18:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235387AbjDDQoM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 12:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235362AbjDDQoL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 12:44:11 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E7DE6C;
        Tue,  4 Apr 2023 09:44:10 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id A7CD75C0161;
        Tue,  4 Apr 2023 12:44:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 04 Apr 2023 12:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devkernel.io; h=
        cc:cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1680626649; x=1680713049; bh=IK
        XJaj89zCSXZFUdNfO6r9AvyGexfDFn5WHbwUeaEBM=; b=nogd+x4TNGtfnYDixP
        mLJ0h9iPq0OR4mUd95f82XEyVDZ91/BA9S4UWApGdKwtr1UUV8U96aqOEsckNGWB
        babOafjo7hhaZj7EhETl6daEQ8VJRHGgJH1sP1hZ2LUDRxAGbWoLZsBNGeqtnPh1
        EJlPm6quwzCfgX9JMRzGDnJstGYPA9C/JdVn8nLlgH2pcMeEtd1vWCa3mTxk1Z2V
        Jw0H6gAf+Y99ovqC+2WPIbExmpAVv0ngtMgFVmQ2/nbbC3s9AaNDkZR3D/0dbyNT
        2IMzGnIPyf1NGGN1fYGuipbXbY5HcZWLLUjEugdIMECb2RUE9C6FCcz17JnDstlL
        Fn6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680626649; x=1680713049; bh=IKXJaj89zCSXZ
        FUdNfO6r9AvyGexfDFn5WHbwUeaEBM=; b=bKbu4U2l7TwF0iaxR203gFnj8QQcl
        ljLNvwUsmqFAxy3nBQzaW0gUPVwbxEuCTF49jNrJ791ZLbg+8rh+x5ITIZEIRtWO
        X927cSGxx9T74LT6slONX23GitMEtKzbOdt+Z/3UviQWyNBNsTYCoEhgGy06xR+q
        95jyHTXv+FrKnUabi93+QK0HArHlYxqCR8TqxS7Q1W/SFJJWiSA/GCTa+gd9Glsg
        Ljj3wz/TU20RZkKxz5Aseft39Hpa0OX1q6KdMDtUpd7Bc6mc14M1bVo20s5JBcHb
        wgGxVMFO844X+BODKaYUugsUJJ8hgZHV0nMVvNva8YQTdB/lu5L0h9lMg==
X-ME-Sender: <xms:2VMsZBVEvynioBVinq8cL5tw4v0ZHbGEWO2BBa2la0ZJuIJM0rekXQ>
    <xme:2VMsZBn37N6f7MNoCWGaGyVBtb8JXSF641IUY24RyLKD3k51fJpZESYAkUeyNL_xM
    IWvYlXOPDm7kPaTz04>
X-ME-Received: <xmr:2VMsZNYDUkEXsbHlFwgbAjoQI78gKI7Ub7LH-MBsIdiUnNvfAHHKwvPO3YMDK5CMUmyutBSl7PAzQLTQ-V78y1IQXnQfxnwdwo2fePbW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpehffgfhvfevufffjgfkgggtsehttdertddtredtnecuhfhrohhmpefuthgv
    fhgrnhcutfhovghstghhuceoshhhrhesuggvvhhkvghrnhgvlhdrihhoqeenucggtffrrg
    htthgvrhhnpeevlefggffhheduiedtheejveehtdfhtedvhfeludetvdegieekgeeggfdu
    geeutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hshhhrseguvghvkhgvrhhnvghlrdhioh
X-ME-Proxy: <xmx:2VMsZEVSieEwr4lFqtUgsN2eSWCCRTT5UgcxknT5WEWEwuP1RqNRWQ>
    <xmx:2VMsZLnJQVE2p8_cV4CdEQVeWT5SUHL7zCacAnSlZ60dVTW9OkpeRQ>
    <xmx:2VMsZBe2sZlbnF1N_73rKQxQiRQsv8HpJFZNURJItn9V2KQ9fCVv9g>
    <xmx:2VMsZEc8gn1gXjzCb0NofGYyLMuWPshY_tXJOwoKOcUpHs54bSavQg>
Feedback-ID: i84614614:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 12:44:07 -0400 (EDT)
References: <20230310182851.2579138-1-shr@devkernel.io>
 <20230310182851.2579138-2-shr@devkernel.io>
 <7ed4308d-b400-d2bb-b539-3fe418862ab8@redhat.com>
 <e888871b-9f48-c01d-ce7f-f32ec3d79ef8@redhat.com>
User-agent: mu4e 1.6.11; emacs 28.2.50
From:   Stefan Roesch <shr@devkernel.io>
To:     David Hildenbrand <david@redhat.com>
Cc:     kernel-team@fb.com, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        hannes@cmpxchg.org, Bagas Sanjaya <bagasdotme@gmail.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v4 1/3] mm: add new api to enable ksm per process
Date:   Tue, 04 Apr 2023 09:43:51 -0700
In-reply-to: <e888871b-9f48-c01d-ce7f-f32ec3d79ef8@redhat.com>
Message-ID: <qvqwzg7nha21.fsf@dev0134.prn3.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


David Hildenbrand <david@redhat.com> writes:

> On 03.04.23 12:37, David Hildenbrand wrote:
>> On 10.03.23 19:28, Stefan Roesch wrote:
>>> Patch series "mm: process/cgroup ksm support", v3.
>>>
>>> So far KSM can only be enabled by calling madvise for memory regions.  To
>>> be able to use KSM for more workloads, KSM needs to have the ability to be
>>> enabled / disabled at the process / cgroup level.
>>>
>>> Use case 1:
>>>
>>>     The madvise call is not available in the programming language.  An
>>>     example for this are programs with forked workloads using a garbage
>>>     collected language without pointers.  In such a language madvise cannot
>>>     be made available.
>>>
>>>     In addition the addresses of objects get moved around as they are
>>>     garbage collected.  KSM sharing needs to be enabled "from the outside"
>>>     for these type of workloads.
>> I guess the interpreter could enable it (like a memory allocator could
>> enable it for the whole heap). But I get that it's much easier to enable
>> this per-process, and eventually only when a lot of the same processes
>> are running in that particular environment.
>>
>>>
>>> Use case 2:
>>>
>>>     The same interpreter can also be used for workloads where KSM brings
>>>     no benefit or even has overhead.  We'd like to be able to enable KSM on
>>>     a workload by workload basis.
>> Agreed. A per-process control is also helpful to identidy workloads
>> where KSM might be beneficial (and to which degree).
>>
>>>
>>> Use case 3:
>>>
>>>     With the madvise call sharing opportunities are only enabled for the
>>>     current process: it is a workload-local decision.  A considerable number
>>>     of sharing opportuniites may exist across multiple workloads or jobs.
>>>     Only a higler level entity like a job scheduler or container can know
>>>     for certain if its running one or more instances of a job.  That job
>>>     scheduler however doesn't have the necessary internal worklaod knowledge
>>>     to make targeted madvise calls.
>>>
>>> Security concerns:
>>>
>>>     In previous discussions security concerns have been brought up.  The
>>>     problem is that an individual workload does not have the knowledge about
>>>     what else is running on a machine.  Therefore it has to be very
>>>     conservative in what memory areas can be shared or not.  However, if the
>>>     system is dedicated to running multiple jobs within the same security
>>>     domain, its the job scheduler that has the knowledge that sharing can be
>>>     safely enabled and is even desirable.
>>>
>>> Performance:
>>>
>>>     Experiments with using UKSM have shown a capacity increase of around
>>>     20%.
>>>
>> As raised, it would be great to include more details about the workload
>> where this particulalry helps (e.g., a lot of Django processes operating
>> in the same domain).
>>
>>>
>>> 1. New options for prctl system command
>>>
>>>      This patch series adds two new options to the prctl system call.
>>>      The first one allows to enable KSM at the process level and the second
>>>      one to query the setting.
>>>
>>>      The setting will be inherited by child processes.
>>>
>>>      With the above setting, KSM can be enabled for the seed process of a
>>>      cgroup and all processes in the cgroup will inherit the setting.
>>>
>>> 2. Changes to KSM processing
>>>
>>>      When KSM is enabled at the process level, the KSM code will iterate
>>>      over all the VMA's and enable KSM for the eligible VMA's.
>>>
>>>      When forking a process that has KSM enabled, the setting will be
>>>      inherited by the new child process.
>>>
>>>      In addition when KSM is disabled for a process, KSM will be disabled
>>>      for the VMA's where KSM has been enabled.
>> Do we want to make MADV_MERGEABLE/MADV_UNMERGEABLE fail while the new
>> prctl is enabled for a process?
>>
>>>
>>> 3. Add general_profit metric
>>>
>>>      The general_profit metric of KSM is specified in the documentation,
>>>      but not calculated.  This adds the general profit metric to
>>>      /sys/kernel/debug/mm/ksm.
>>>
>>> 4. Add more metrics to ksm_stat
>>>
>>>      This adds the process profit and ksm type metric to
>>>      /proc/<pid>/ksm_stat.
>>>
>>> 5. Add more tests to ksm_tests
>>>
>>>      This adds an option to specify the merge type to the ksm_tests.
>>>      This allows to test madvise and prctl KSM.  It also adds a new option
>>>      to query if prctl KSM has been enabled.  It adds a fork test to verify
>>>      that the KSM process setting is inherited by client processes.
>>>
>>> An update to the prctl(2) manpage has been proposed at [1].
>>>
>>> This patch (of 3):
>>>
>>> This adds a new prctl to API to enable and disable KSM on a per process
>>> basis instead of only at the VMA basis (with madvise).
>>>
>>> 1) Introduce new MMF_VM_MERGE_ANY flag
>>>
>>>      This introduces the new flag MMF_VM_MERGE_ANY flag.  When this flag
>>>      is set, kernel samepage merging (ksm) gets enabled for all vma's of a
>>>      process.
>>>
>>> 2) add flag to __ksm_enter
>>>
>>>      This change adds the flag parameter to __ksm_enter.  This allows to
>>>      distinguish if ksm was called by prctl or madvise.
>>>
>>> 3) add flag to __ksm_exit call
>>>
>>>      This adds the flag parameter to the __ksm_exit() call.  This allows
>>>      to distinguish if this call is for an prctl or madvise invocation.
>>>
>>> 4) invoke madvise for all vmas in scan_get_next_rmap_item
>>>
>>>      If the new flag MMF_VM_MERGE_ANY has been set for a process, iterate
>>>      over all the vmas and enable ksm if possible.  For the vmas that can be
>>>      ksm enabled this is only done once.
>>>
>>> 5) support disabling of ksm for a process
>>>
>>>      This adds the ability to disable ksm for a process if ksm has been
>>>      enabled for the process.
>>>
>>> 6) add new prctl option to get and set ksm for a process
>>>
>>>      This adds two new options to the prctl system call
>>>      - enable ksm for all vmas of a process (if the vmas support it).
>>>      - query if ksm has been enabled for a process.
>> Did you consider, instead of handling MMF_VM_MERGE_ANY in a special way,
>> to instead make it reuse the existing MMF_VM_MERGEABLE/VM_MERGEABLE
>> infrastructure. Especially:
>> 1) During prctl(MMF_VM_MERGE_ANY), set VM_MERGABLE on all applicable
>>      compatible. Further, set MMF_VM_MERGEABLE and enter KSM if not
>>      already set.
>> 2) When creating a new, compatible VMA and MMF_VM_MERGE_ANY is set, set
>>      VM_MERGABLE?
>> The you can avoid all runtime checks for compatible VMAs and only look
>> at the VM_MERGEABLE flag. In fact, the VM_MERGEABLE will be completely
>> expressive then for all VMAs. You don't need vma_ksm_mergeable() then.
>> Another thing to consider is interaction with arch/s390/mm/gmap.c:
>> s390x/kvm does not support KSM and it has to disable it for all VMAs. We
>> have to find a way to fence the prctl (for example, fail setting the
>> prctl after gmap_mark_unmergeable() ran, and make
>> gmap_mark_unmergeable() fail if the prctl ran -- or handle it gracefully
>> in some other way).

gmap_mark_unmergeable() seems to have a problem today. We can execute
gmap_mark_unmergeable() and mark the vma's as unmergeable, but shortly
after that the process can run madvise on it again and make it
mergeable. Am I mssing something here?

Once prctl is run, we can check for the MMF_VM_MERGE_ANY flag in
gmap_mark_unmergeable(). In case it is set, we can return an error. The
error code path looks like it can handle that case.

For the opposite case: gmap_mark_unmergeable() has already been run, we
would need some kind of flag or other means to be able to detect it.
Any recommendations?

>
>
> Staring at that code, I wonder if the "mm->def_flags &= ~VM_MERGEABLE" is doing
> what it's supposed to do. I don't think this effectively prevents right now
> madvise() from getting re-enabled on that VMA.
>
> @Christian, Janosch, am I missing something?
