Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5144B74797E
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jul 2023 23:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjGDVRl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Jul 2023 17:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjGDVRl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jul 2023 17:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C752187
        for <linux-doc@vger.kernel.org>; Tue,  4 Jul 2023 14:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688505412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VV04n37U8nBXKx7jlfEZg7R8H9gfvZ1yfEmW1FTRWAc=;
        b=LDOmEEyxrmHT8Ccjq6ljx8l6JikH5iba0NFkW4DXzZm2iwyDN7r9WzkvQMDyYZV9Fp18tO
        pJYKNwL8T6oxnJv8CVJ7uN19vYt1ttOLA4F+Pejvqlv7K9bfo1DVeTby0lnjt7h0RlTGDA
        jkd2hfi4iLP2Gv2YBbarurcI+aFD33s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-ZopPRVeANzKatSxxGDcIrQ-1; Tue, 04 Jul 2023 17:16:51 -0400
X-MC-Unique: ZopPRVeANzKatSxxGDcIrQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76716078e78so107821685a.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Jul 2023 14:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688505410; x=1691097410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VV04n37U8nBXKx7jlfEZg7R8H9gfvZ1yfEmW1FTRWAc=;
        b=HAsDqi5z+yzl+PjkXChjD1UoYxaArp5rFim2etlIugEt3ADQ7MPnchkeAzhw/SxqZ2
         DyMSMLgWqEdjI4bJ9p9bZXSLU2sIUlyO0iRhoXR02BsQCZ947P8NiAq83YKjUsHK+Ur+
         78ReDpdR5uuHKUVTr/sHon2+4jC/9dL5XwdrkUNL7Dww8lUP3RbIfIv7+jpyiDRW/DTd
         eWOXwy1hbzolPFJGe7Skl/tSI2hnzWpN37bZPAvWc50SuP2k7GP1CxJKmR0Ocbbhx6Jg
         Jgl+At+RTfobGso9KlcRuzrtRlKaXf+Bm8Og4zNfh9Oo+VFRe/a+v5S/dwfXcw1HBF8j
         O4hw==
X-Gm-Message-State: AC+VfDw3m50mDpWtHVelkI9dQ1SAciC/4RJaOIBt+kCE1nVvJvW3ZMsT
        lOe0ZH9TniEShlWY0uI07JeLaFkhKAo3O7wkAOi0CGzMr6q4+PuDZTik3yDMqlK6NLMjXFK69wE
        ODWiJXsQoBd46dSPFbLol
X-Received: by 2002:a05:620a:4487:b0:765:435c:a4fa with SMTP id x7-20020a05620a448700b00765435ca4famr20273163qkp.0.1688505410591;
        Tue, 04 Jul 2023 14:16:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4h9qxm2qr2McyrSm55+RKE46g3KUdAtCtYdQn6fLq1MJrI38m4oaSBNE07KxZKvdH+XrvoEw==
X-Received: by 2002:a05:620a:4487:b0:765:435c:a4fa with SMTP id x7-20020a05620a448700b00765435ca4famr20273141qkp.0.1688505410353;
        Tue, 04 Jul 2023 14:16:50 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id i4-20020a05620a144400b0076728319575sm6994582qkl.27.2023.07.04.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 14:16:50 -0700 (PDT)
Date:   Tue, 4 Jul 2023 17:16:48 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Shuah Khan <shuah@kernel.org>,
        ZhangPeng <zhangpeng362@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mm: userfaultfd: add basic documentation for
 UFFDIO_POISON
Message-ID: <ZKSMQOUB99HjlUN5@x1n>
References: <20230629205040.665834-1-axelrasmussen@google.com>
 <20230629205040.665834-6-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230629205040.665834-6-axelrasmussen@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 29, 2023 at 01:50:40PM -0700, Axel Rasmussen wrote:
> Just describe the feature at a really basic level.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

The final enablement of the feature can be squashed into this doc update
patch too.

Acked-by: Peter Xu <peterx@redhat.com>

> ---
>  Documentation/admin-guide/mm/userfaultfd.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
> index 7c304e432205..b19053436369 100644
> --- a/Documentation/admin-guide/mm/userfaultfd.rst
> +++ b/Documentation/admin-guide/mm/userfaultfd.rst
> @@ -244,6 +244,21 @@ write-protected (so future writes will also result in a WP fault). These ioctls
>  support a mode flag (``UFFDIO_COPY_MODE_WP`` or ``UFFDIO_CONTINUE_MODE_WP``
>  respectively) to configure the mapping this way.
>  
> +Memory Poisioning Emulation
> +---------------------------
> +
> +In response to a fault (either missing or minor), an action userspace can
> +take to "resolve" it is to issue a ``UFFDIO_POISON``. This will cause any
> +future faulters to either get a SIGBUS, or in KVM's case the guest will
> +receive an MCE as if there were hardware memory poisoning.
> +
> +This is used to emulate hardware memory poisoning. Imagine a VM running on a
> +machine which experiences a real hardware memory error. Later, we live migrate
> +the VM to another physical machine. Since we want the migration to be
> +transparent to the guest, we want that same address range to act as if it was
> +still poisoned, even though it's on a new physical host which ostentisbly
> +doesn't have a memory error in the exact same spot.
> +
>  QEMU/KVM
>  ========
>  
> -- 
> 2.41.0.255.g8b1d071c50-goog
> 

-- 
Peter Xu

