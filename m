Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596267ACF02
	for <lists+linux-doc@lfdr.de>; Mon, 25 Sep 2023 06:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjIYEHU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Sep 2023 00:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbjIYEHU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Sep 2023 00:07:20 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4675DE1
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 21:06:49 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6c4e30a3604so1097923a34.2
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 21:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695614808; x=1696219608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjdsejtXM4FK3cSifJF0aNWIIdL1SGVdo9mbVceJXvw=;
        b=ZCYDtHZ3mjfNs5eh9ur0GWsB8EMc1DmCJl4PYruK9trPWIXllkhlOXRwuga1BO25aR
         ghmFX/opVX+VMk7TrqkXjLIsndujNF8CuaqAzgYEp8ZLJd1BGxSqmxibW68F1TWslFK4
         AIFt5J70mOJW7hHdUFksAVy64gbTgfn/hM0OCznEKQ+LNhHX+wAFkv+cESAeuifBDbRL
         jo2x0eLkPwrvdw1DrhaWjFCdu4vdvtVyqWR+M9Ml62eYroY/0RY+Qh/uscYOzriJgF39
         FZMDk6Fozj+jomaMJt9WPE9K78bvSs2v3HHA2hBKUs2TN+0LXqqzbaJhGkUGHzHbHwox
         iIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695614808; x=1696219608;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KjdsejtXM4FK3cSifJF0aNWIIdL1SGVdo9mbVceJXvw=;
        b=CAR6DurMLiwV0H8vn/RdiYOi1+BAiv6RcPtsKXfLto8o4MQ2W1Nx5Zl0tQOQ07V8BO
         9AVm7dN2Mn1rTSrzqFmGC3DiZdDVNBpSsFYzzQa52nEsN42B5eQyfJNY0PMSVrII+uvR
         HKnmL53CZXrn4NiCZSqEDg4hWjkDE/jArxlIDxbsu0ZkjpOS3VvIhpSKoXaEN1E8Rrof
         62YAnyRd+PHu87ubvDgfHDZeN7hYd06FydE1MZwYlRz3fSpIihj7cKmZRsVOpnjgiV3c
         gHvxZMQwM5u9xa4OD5GcLdAWLWvxNDXimCaaVvcpekLPXX8BymyBALz3G+sHLIXhEDd9
         nIjw==
X-Gm-Message-State: AOJu0YyfHTvv4rsv7EIA6oL4BOFvjT93XXSL5DA3YAlrauDjfqIySVC/
        4usoeUup/+zZK3Oia6+n47RR0g==
X-Google-Smtp-Source: AGHT+IFGQitQEvCjR9anQQqFAmYe/oi2wEbcAHWuB0f5/biQOuLuIBx0aULmNGJbJOPe/lJMK7WQoQ==
X-Received: by 2002:a05:6358:528e:b0:135:a10e:1ed0 with SMTP id g14-20020a056358528e00b00135a10e1ed0mr7895862rwa.23.1695614808330;
        Sun, 24 Sep 2023 21:06:48 -0700 (PDT)
Received: from [10.84.144.104] ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id b28-20020a63715c000000b00578b40a4903sm4244335pgn.22.2023.09.24.21.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 21:06:47 -0700 (PDT)
Message-ID: <65fbae1b-6253-8a37-2adb-e9c5612ff8e3@bytedance.com>
Date:   Mon, 25 Sep 2023 12:06:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/6] maple_tree: Add test for mtree_dup()
To:     "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Peng Zhang <zhangpeng.00@bytedance.com>, corbet@lwn.net,
        akpm@linux-foundation.org, willy@infradead.org, brauner@kernel.org,
        surenb@google.com, michael.christie@oracle.com,
        peterz@infradead.org, mathieu.desnoyers@efficios.com,
        npiggin@gmail.com, avagin@gmail.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20230830125654.21257-1-zhangpeng.00@bytedance.com>
 <20230830125654.21257-4-zhangpeng.00@bytedance.com>
 <20230907201353.jv6bojekvamvdzaj@revolver>
From:   Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20230907201353.jv6bojekvamvdzaj@revolver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2023/9/8 04:13, Liam R. Howlett 写道:
> * Peng Zhang <zhangpeng.00@bytedance.com> [230830 08:57]:
>> Add test for mtree_dup().
> 
> Please add a better description of what tests are included.
> 
>>
>> Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
>> ---
>>   tools/testing/radix-tree/maple.c | 344 +++++++++++++++++++++++++++++++
>>   1 file changed, 344 insertions(+)
>>
>> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
>> index e5da1cad70ba..38455916331e 100644
>> --- a/tools/testing/radix-tree/maple.c
>> +++ b/tools/testing/radix-tree/maple.c
> 
> Why not lib/test_maple_tree.c?
> 
> If they are included there then they will be built into the test module.
> I try to include any tests that I can in the test module, within reason.
> 
> 
>> @@ -35857,6 +35857,346 @@ static noinline void __init check_locky(struct maple_tree *mt)
>>   	mt_clear_in_rcu(mt);
>>   }
>>   
>> +/*
>> + * Compare two nodes and return 0 if they are the same, non-zero otherwise.
> 
> The slots can be different, right?  That seems worth mentioning here.
> It's also worth mentioning this is destructive.
I compared the type information in the slots, but the addresses cannot
be compared because they are different.
> 
>> + */
>> +static int __init compare_node(struct maple_enode *enode_a,
>> +			       struct maple_enode *enode_b)
>> +{
>> +	struct maple_node *node_a, *node_b;
>> +	struct maple_node a, b;
>> +	void **slots_a, **slots_b; /* Do not use the rcu tag. */
>> +	enum maple_type type;
>> +	int i;
>> +
>> +	if (((unsigned long)enode_a & MAPLE_NODE_MASK) !=
>> +	    ((unsigned long)enode_b & MAPLE_NODE_MASK)) {
>> +		pr_err("The lower 8 bits of enode are different.\n");
>> +		return -1;
>> +	}
>> +
>> +	type = mte_node_type(enode_a);
>> +	node_a = mte_to_node(enode_a);
>> +	node_b = mte_to_node(enode_b);
>> +	a = *node_a;
>> +	b = *node_b;
>> +
>> +	/* Do not compare addresses. */
>> +	if (ma_is_root(node_a) || ma_is_root(node_b)) {
>> +		a.parent = (struct maple_pnode *)((unsigned long)a.parent &
>> +						  MA_ROOT_PARENT);
>> +		b.parent = (struct maple_pnode *)((unsigned long)b.parent &
>> +						  MA_ROOT_PARENT);
>> +	} else {
>> +		a.parent = (struct maple_pnode *)((unsigned long)a.parent &
>> +						  MAPLE_NODE_MASK);
>> +		b.parent = (struct maple_pnode *)((unsigned long)b.parent &
>> +						  MAPLE_NODE_MASK);
>> +	}
>> +
>> +	if (a.parent != b.parent) {
>> +		pr_err("The lower 8 bits of parents are different. %p %p\n",
>> +			a.parent, b.parent);
>> +		return -1;
>> +	}
>> +
>> +	/*
>> +	 * If it is a leaf node, the slots do not contain the node address, and
>> +	 * no special processing of slots is required.
>> +	 */
>> +	if (ma_is_leaf(type))
>> +		goto cmp;
>> +
>> +	slots_a = ma_slots(&a, type);
>> +	slots_b = ma_slots(&b, type);
>> +
>> +	for (i = 0; i < mt_slots[type]; i++) {
>> +		if (!slots_a[i] && !slots_b[i])
>> +			break;
>> +
>> +		if (!slots_a[i] || !slots_b[i]) {
>> +			pr_err("The number of slots is different.\n");
>> +			return -1;
>> +		}
>> +
>> +		/* Do not compare addresses in slots. */
>> +		((unsigned long *)slots_a)[i] &= MAPLE_NODE_MASK;
>> +		((unsigned long *)slots_b)[i] &= MAPLE_NODE_MASK;
>> +	}
>> +
>> +cmp:
>> +	/*
>> +	 * Compare all contents of two nodes, including parent (except address),
>> +	 * slots (except address), pivots, gaps and metadata.
>> +	 */
>> +	return memcmp(&a, &b, sizeof(struct maple_node));
>> +}
>> +
>> +/*
>> + * Compare two trees and return 0 if they are the same, non-zero otherwise.
>> + */
>> +static int __init compare_tree(struct maple_tree *mt_a, struct maple_tree *mt_b)
>> +{
>> +	MA_STATE(mas_a, mt_a, 0, 0);
>> +	MA_STATE(mas_b, mt_b, 0, 0);
>> +
>> +	if (mt_a->ma_flags != mt_b->ma_flags) {
>> +		pr_err("The flags of the two trees are different.\n");
>> +		return -1;
>> +	}
>> +
>> +	mas_dfs_preorder(&mas_a);
>> +	mas_dfs_preorder(&mas_b);
>> +
>> +	if (mas_is_ptr(&mas_a) || mas_is_ptr(&mas_b)) {
>> +		if (!(mas_is_ptr(&mas_a) && mas_is_ptr(&mas_b))) {
>> +			pr_err("One is MAS_ROOT and the other is not.\n");
>> +			return -1;
>> +		}
>> +		return 0;
>> +	}
>> +
>> +	while (!mas_is_none(&mas_a) || !mas_is_none(&mas_b)) {
>> +
>> +		if (mas_is_none(&mas_a) || mas_is_none(&mas_b)) {
>> +			pr_err("One is MAS_NONE and the other is not.\n");
>> +			return -1;
>> +		}
>> +
>> +		if (mas_a.min != mas_b.min ||
>> +		    mas_a.max != mas_b.max) {
>> +			pr_err("mas->min, mas->max do not match.\n");
>> +			return -1;
>> +		}
>> +
>> +		if (compare_node(mas_a.node, mas_b.node)) {
>> +			pr_err("The contents of nodes %p and %p are different.\n",
>> +			       mas_a.node, mas_b.node);
>> +			mt_dump(mt_a, mt_dump_dec);
>> +			mt_dump(mt_b, mt_dump_dec);
>> +			return -1;
>> +		}
>> +
>> +		mas_dfs_preorder(&mas_a);
>> +		mas_dfs_preorder(&mas_b);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static __init void mas_subtree_max_range(struct ma_state *mas)
>> +{
>> +	unsigned long limit = mas->max;
>> +	MA_STATE(newmas, mas->tree, 0, 0);
>> +	void *entry;
>> +
>> +	mas_for_each(mas, entry, limit) {
>> +		if (mas->last - mas->index >=
>> +		    newmas.last - newmas.index) {
>> +			newmas = *mas;
>> +		}
>> +	}
>> +
>> +	*mas = newmas;
>> +}
>> +
>> +/*
>> + * build_full_tree() - Build a full tree.
>> + * @mt: The tree to build.
>> + * @flags: Use @flags to build the tree.
>> + * @height: The height of the tree to build.
>> + *
>> + * Build a tree with full leaf nodes and internal nodes. Note that the height
>> + * should not exceed 3, otherwise it will take a long time to build.
>> + * Return: zero if the build is successful, non-zero if it fails.
>> + */
>> +static __init int build_full_tree(struct maple_tree *mt, unsigned int flags,
>> +		int height)
>> +{
>> +	MA_STATE(mas, mt, 0, 0);
>> +	unsigned long step;
>> +	int ret = 0, cnt = 1;
>> +	enum maple_type type;
>> +
>> +	mt_init_flags(mt, flags);
>> +	mtree_insert_range(mt, 0, ULONG_MAX, xa_mk_value(5), GFP_KERNEL);
>> +
>> +	mtree_lock(mt);
>> +
>> +	while (1) {
>> +		mas_set(&mas, 0);
>> +		if (mt_height(mt) < height) {
>> +			mas.max = ULONG_MAX;
>> +			goto store;
>> +		}
>> +
>> +		while (1) {
>> +			mas_dfs_preorder(&mas);
>> +			if (mas_is_none(&mas))
>> +				goto unlock;
>> +
>> +			type = mte_node_type(mas.node);
>> +			if (mas_data_end(&mas) + 1 < mt_slots[type]) {
>> +				mas_set(&mas, mas.min);
>> +				goto store;
>> +			}
>> +		}
>> +store:
>> +		mas_subtree_max_range(&mas);
>> +		step = mas.last - mas.index;
>> +		if (step < 1) {
>> +			ret = -1;
>> +			goto unlock;
>> +		}
>> +
>> +		step /= 2;
>> +		mas.last = mas.index + step;
>> +		mas_store_gfp(&mas, xa_mk_value(5),
>> +				GFP_KERNEL);
>> +		++cnt;
>> +	}
>> +unlock:
>> +	mtree_unlock(mt);
>> +
>> +	MT_BUG_ON(mt, mt_height(mt) != height);
>> +	/* pr_info("height:%u number of elements:%d\n", mt_height(mt), cnt); */
>> +	return ret;
>> +}
>> +
>> +static noinline void __init check_mtree_dup(struct maple_tree *mt)
>> +{
>> +	DEFINE_MTREE(new);
>> +	int i, j, ret, count = 0;
>> +	unsigned int rand_seed = 17, rand;
>> +
>> +	/* store a value at [0, 0] */
>> +	mt_init_flags(&tree, 0);
>> +	mtree_store_range(&tree, 0, 0, xa_mk_value(0), GFP_KERNEL);
>> +	ret = mtree_dup(&tree, &new, GFP_KERNEL);
>> +	MT_BUG_ON(&new, ret);
>> +	mt_validate(&new);
>> +	if (compare_tree(&tree, &new))
>> +		MT_BUG_ON(&new, 1);
>> +
>> +	mtree_destroy(&tree);
>> +	mtree_destroy(&new);
>> +
>> +	/* The two trees have different attributes. */
>> +	mt_init_flags(&tree, 0);
>> +	mt_init_flags(&new, MT_FLAGS_ALLOC_RANGE);
>> +	ret = mtree_dup(&tree, &new, GFP_KERNEL);
>> +	MT_BUG_ON(&new, ret != -EINVAL);
>> +	mtree_destroy(&tree);
>> +	mtree_destroy(&new);
>> +
>> +	/* The new tree is not empty */
>> +	mt_init_flags(&tree, 0);
>> +	mt_init_flags(&new, 0);
>> +	mtree_store(&new, 5, xa_mk_value(5), GFP_KERNEL);
>> +	ret = mtree_dup(&tree, &new, GFP_KERNEL);
>> +	MT_BUG_ON(&new, ret != -EINVAL);
>> +	mtree_destroy(&tree);
>> +	mtree_destroy(&new);
>> +
>> +	/* Test for duplicating full trees. */
>> +	for (i = 1; i <= 3; i++) {
>> +		ret = build_full_tree(&tree, 0, i);
>> +		MT_BUG_ON(&tree, ret);
>> +		mt_init_flags(&new, 0);
>> +
>> +		ret = mtree_dup(&tree, &new, GFP_KERNEL);
>> +		MT_BUG_ON(&new, ret);
>> +		mt_validate(&new);
>> +		if (compare_tree(&tree, &new))
>> +			MT_BUG_ON(&new, 1);
>> +
>> +		mtree_destroy(&tree);
>> +		mtree_destroy(&new);
>> +	}
>> +
>> +	for (i = 1; i <= 3; i++) {
>> +		ret = build_full_tree(&tree, MT_FLAGS_ALLOC_RANGE, i);
>> +		MT_BUG_ON(&tree, ret);
>> +		mt_init_flags(&new, MT_FLAGS_ALLOC_RANGE);
>> +
>> +		ret = mtree_dup(&tree, &new, GFP_KERNEL);
>> +		MT_BUG_ON(&new, ret);
>> +		mt_validate(&new);
>> +		if (compare_tree(&tree, &new))
>> +			MT_BUG_ON(&new, 1);
>> +
>> +		mtree_destroy(&tree);
>> +		mtree_destroy(&new);
>> +	}
>> +
>> +	/* Test for normal duplicating. */
>> +	for (i = 0; i < 1000; i += 3) {
>> +		if (i & 1) {
>> +			mt_init_flags(&tree, 0);
>> +			mt_init_flags(&new, 0);
>> +		} else {
>> +			mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
>> +			mt_init_flags(&new, MT_FLAGS_ALLOC_RANGE);
>> +		}
>> +
>> +		for (j = 0; j < i; j++) {
>> +			mtree_store_range(&tree, j * 10, j * 10 + 5,
>> +					  xa_mk_value(j), GFP_KERNEL);
>> +		}
>> +
>> +		ret = mtree_dup(&tree, &new, GFP_KERNEL);
>> +		MT_BUG_ON(&new, ret);
>> +		mt_validate(&new);
>> +		if (compare_tree(&tree, &new))
>> +			MT_BUG_ON(&new, 1);
>> +
>> +		mtree_destroy(&tree);
>> +		mtree_destroy(&new);
>> +	}
>> +
>> +	/* Test memory allocation failed. */
> 
> It might be worth while having specific allocations fail.  At a leaf
> node, intermediate nodes, first node come to mind.
Memory allocation is only possible in non-leaf nodes. It is impossible
to fail in leaf nodes.
> 
>> +	for (i = 0; i < 1000; i += 3) {
>> +		if (i & 1) {
>> +			mt_init_flags(&tree, 0);
>> +			mt_init_flags(&new, 0);
>> +		} else {
>> +			mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
>> +			mt_init_flags(&new, MT_FLAGS_ALLOC_RANGE);
>> +		}
>> +
>> +		for (j = 0; j < i; j++) {
>> +			mtree_store_range(&tree, j * 10, j * 10 + 5,
>> +					  xa_mk_value(j), GFP_KERNEL);
>> +		}
>> +		/*
>> +		 * The rand() library function is not used, so we can generate
>> +		 * the same random numbers on any platform.
>> +		 */
>> +		rand_seed = rand_seed * 1103515245 + 12345;
>> +		rand = rand_seed / 65536 % 128;
>> +		mt_set_non_kernel(rand);
>> +
>> +		ret = mtree_dup(&tree, &new, GFP_NOWAIT);
>> +		mt_set_non_kernel(0);
>> +		if (ret != 0) {
>> +			MT_BUG_ON(&new, ret != -ENOMEM);
>> +			count++;
>> +			mtree_destroy(&tree);
>> +			continue;
>> +		}
>> +
>> +		mt_validate(&new);
>> +		if (compare_tree(&tree, &new))
>> +			MT_BUG_ON(&new, 1);
>> +
>> +		mtree_destroy(&tree);
>> +		mtree_destroy(&new);
>> +	}
>> +
>> +	/* pr_info("mtree_dup() fail %d times\n", count); */
>> +	BUG_ON(!count);
>> +}
>> +
>>   extern void test_kmem_cache_bulk(void);
>>   
>>   void farmer_tests(void)
>> @@ -35904,6 +36244,10 @@ void farmer_tests(void)
>>   	check_null_expand(&tree);
>>   	mtree_destroy(&tree);
>>   
>> +	mt_init_flags(&tree, 0);
>> +	check_mtree_dup(&tree);
>> +	mtree_destroy(&tree);
>> +
>>   	/* RCU testing */
>>   	mt_init_flags(&tree, 0);
>>   	check_erase_testset(&tree);
>> -- 
>> 2.20.1
>>
