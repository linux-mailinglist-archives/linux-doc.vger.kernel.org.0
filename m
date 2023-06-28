Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011F07415CA
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jun 2023 17:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjF1Pzf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Jun 2023 11:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52303 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231248AbjF1PzS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jun 2023 11:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687967668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H9XkIQPUhWJqpcos5yICyN5nXtK7ObPVOfjAyLG61Jw=;
        b=RbX+TyfrDh2TvW/QpxeEWufGOQIG8C/E1djKsGONdIfMfxFkOuM0j1fX+di4H2Ddz1U4ap
        M1hawxRaD700oPCHQpadqLd+WeWZo5v606CC/HmsusbSLfr1hxyXnB9UWWWJTR3cMvA3OI
        LL2c1cuS63+GqFDpbL56wc7f1b+OkWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-w473wJGPPy6hhyW6F0PIRw-1; Wed, 28 Jun 2023 11:54:20 -0400
X-MC-Unique: w473wJGPPy6hhyW6F0PIRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DECE18DBAEE;
        Wed, 28 Jun 2023 15:53:34 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com (segfault.boston.devel.redhat.com [10.19.60.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 074D5154D8A1;
        Wed, 28 Jun 2023 15:53:34 +0000 (UTC)
From:   Jeff Moyer <jmoyer@redhat.com>
To:     Gabriel Krisman Bertazi <krisman@suse.de>
Cc:     Matteo Rizzo <matteorizzo@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
        jordyzomer@google.com, evn@google.com, poprdi@google.com,
        corbet@lwn.net, axboe@kernel.dk, asml.silence@gmail.com,
        akpm@linux-foundation.org, keescook@chromium.org,
        rostedt@goodmis.org, dave.hansen@linux.intel.com,
        ribalda@chromium.org, chenhuacai@kernel.org, steve@sk2.org,
        gpiccoli@igalia.com, ldufour@linux.ibm.com
Subject: Re: [PATCH 1/1] Add a new sysctl to disable io_uring system-wide
References: <20230627120058.2214509-1-matteorizzo@google.com>
        <20230627120058.2214509-2-matteorizzo@google.com>
        <87ilb7ofv6.fsf@suse.de>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date:   Wed, 28 Jun 2023 11:59:25 -0400
In-Reply-To: <87ilb7ofv6.fsf@suse.de> (Gabriel Krisman Bertazi's message of
        "Wed, 28 Jun 2023 09:50:37 -0400")
Message-ID: <x49bkgzefxe.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> Matteo Rizzo <matteorizzo@google.com> writes:
>
>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>> index d85d90f5d000..3c53a238332a 100644
>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>> @@ -450,6 +450,20 @@ this allows system administrators to override the
>>  ``IA64_THREAD_UAC_NOPRINT`` ``prctl`` and avoid logs being flooded.
>>  
>>  
>> +io_uring_disabled
>> +=========================
>> +
>> +Prevents all processes from creating new io_uring instances. Enabling this
>> +shrinks the kernel's attack surface.
>> +
>> += =============================================================
>> +0 All processes can create io_uring instances as normal. This is the default
>> +  setting.
>> +1 io_uring is disabled. io_uring_setup always fails with -EPERM. Existing
>> +  io_uring instances can still be used.
>> += =============================================================
>
> I had an internal request for something like this recently.  If we go
> this route, we could use a intermediary option that limits io_uring
> to root processes only.

This is all regrettable, but this option makes the most sense to me.
Testing for CAP_SYS_ADMIN or CAP_SYS_RAW_IO would work for that third
option, I think.

-Jeff

