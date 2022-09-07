Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E3D5B0B91
	for <lists+linux-doc@lfdr.de>; Wed,  7 Sep 2022 19:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiIGRe4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Sep 2022 13:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIGRez (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Sep 2022 13:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0434326AC8
        for <linux-doc@vger.kernel.org>; Wed,  7 Sep 2022 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662572092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/WSF+VN2XS8wigr1Pv23cqcOJp3LkqpRzWMbXnSC+Ks=;
        b=HePHF87PNdfoQE0852rUI59XJLN38cCHNQ85pSJiW9rBLCJVHt7kUeEtW2BjAYam8IwXBC
        6OHZPcV2G2GNTEy0ufUNc1kp8BQ1Xy9JrUP3CF0HVUI+ZIx4homzudHrsRPVAoFNc5C8Ra
        6lOFVwkf/7ZbPErR9vvlN/3lfnzJSoM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-yf-Xh7BAMdGuIeY70rsvDA-1; Wed, 07 Sep 2022 13:34:48 -0400
X-MC-Unique: yf-Xh7BAMdGuIeY70rsvDA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A26F3806701;
        Wed,  7 Sep 2022 17:34:47 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.54])
        by smtp.corp.redhat.com (Postfix) with SMTP id 04716403167;
        Wed,  7 Sep 2022 17:34:42 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed,  7 Sep 2022 19:34:46 +0200 (CEST)
Date:   Wed, 7 Sep 2022 19:34:40 +0200
From:   Oleg Nesterov <oleg@redhat.com>
To:     Oleksandr Natalenko <oleksandr@redhat.com>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Huang Ying <ying.huang@intel.com>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Will Deacon <will@kernel.org>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Stephen Kitt <steve@sk2.org>, Rob Herring <robh@kernel.org>,
        Joel Savitz <jsavitz@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Xiaoming Ni <nixiaoming@huawei.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Renaud =?iso-8859-1?Q?M=E9trich?= <rmetrich@redhat.com>,
        Grzegorz Halat <ghalat@redhat.com>, Qi Guo <qguo@redhat.com>
Subject: Re: [PATCH] core_pattern: add CPU specifier
Message-ID: <20220907173438.GA15992@redhat.com>
References: <20220903064330.20772-1-oleksandr@redhat.com>
 <87r10ob0st.fsf@email.froward.int.ebiederm.org>
 <5599808.DvuYhMxLoT@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5599808.DvuYhMxLoT@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/07, Oleksandr Natalenko wrote:
>
> The advantage of having CPU recorded in the file name is that
> in case of multiple cores one can summarise them with a simple
> ls+grep without invoking a fully-featured debugger to find out
> whether the segfaults happened on the same CPU.

Besides, if you only need to gather the statistics about the faulting
CPU(s), you do not even need to actually dump the the core. For example,
something like

	#!/usr/bin/sh

	echo $* >> path/to/coredump-stat.txt

and
	echo '| path-to-script-above %C' >/proc/sys/kernel/core_pattern

can help.

Oleg.

