Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7EF6FC291
	for <lists+linux-doc@lfdr.de>; Tue,  9 May 2023 11:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbjEIJUE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 May 2023 05:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbjEIJUD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 05:20:03 -0400
Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D3DDDBD;
        Tue,  9 May 2023 02:19:51 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.18.147.228])
        by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4QFsn16k6nz9v7GY;
        Tue,  9 May 2023 17:09:57 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.212.219])
        by APP2 (Coremail) with SMTP id GxC2BwDHdz7lD1pksN2OAg--.5S4;
        Tue, 09 May 2023 10:19:13 +0100 (CET)
From:   Petr Tesarik <petrtesarik@huaweicloud.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Kim Phillips <kim.phillips@amd.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
        iommu@lists.linux.dev (open list:DMA MAPPING HELPERS)
Cc:     Roberto Sassu <roberto.sassu@huawei.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>, petr@tesarici.cz
Subject: [PATCH v2 RESEND 2/7] swiotlb: Move code around in preparation for dynamic bounce buffers
Date:   Tue,  9 May 2023 11:18:14 +0200
Message-Id: <74fc11b6f9422a0d7688c68ed13ee35a0fe1ff13.1683623618.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwDHdz7lD1pksN2OAg--.5S4
X-Coremail-Antispam: 1UD129KBjvJXoW3JryUur45Aw47Kw4fKF4kZwb_yoW3uFWUpF
        1rtF1rtFsxJF1xC397uw48JF1rCw1kCry3Caya9ryF9Fy3Xrn0vFs8CrW5WayFvFWv9F4U
        Xr98uF4fGa17Jr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPSb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
        6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
        A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
        w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
        WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
        Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
        Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
        6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0Ew4C26c
        xK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
        F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr
        1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
        7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
        0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
        U8qQ6JUUUUU==
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

To prepare for the introduction of dynamically allocated bounce
buffers, separate out common code and code which handles non-dynamic
(aka fixed) bounce buffers.

No functional change, but this commit should make the addition of
dynamic allocations easier to review.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/swiotlb.h |  31 ++++++++++-
 kernel/dma/swiotlb.c    | 110 +++++++++++++++++++++++++++++++++-------
 2 files changed, 122 insertions(+), 19 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d851dbce1143..281ecc6b9bcc 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -114,11 +114,40 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem io_tlb_default_mem;
 
+/**
+ * is_swiotlb_fixed() - check if a physical address belongs to a swiotlb slot
+ * @mem:	relevant swiotlb pool
+ * @paddr:	physical address within the DMA buffer
+ *
+ * Check if @paddr points into a fixed bounce buffer slot.
+ * This check should be as fast as possible.
+ *
+ * Return:
+ * * %true if @paddr points into a @mem fixed slot
+ * * %false otherwise
+ */
+static inline bool is_swiotlb_fixed(struct io_tlb_mem *mem, phys_addr_t paddr)
+{
+	return paddr >= mem->start && paddr < mem->end;
+}
+
+/**
+ * is_swiotlb_buffer() - check if a physical address is allocated from the
+ *                       swiotlb pool
+ * @dev:	device which has mapped the buffer
+ * @paddr:	physical address within the DMA buffer
+ *
+ * Check if @paddr points into a bounce buffer.
+ *
+ * Return:
+ * * %true if @paddr points into a bounce buffer
+ * * %false otherwise
+ */
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
-	return mem && paddr >= mem->start && paddr < mem->end;
+	return mem && is_swiotlb_fixed(mem, paddr);
 }
 
 static inline bool is_swiotlb_force_bounce(struct device *dev)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index af2e304c672c..96ba93be6772 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -76,6 +76,10 @@ struct io_tlb_mem io_tlb_default_mem;
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 static unsigned long default_nareas;
 
+static void swiotlb_copy(struct device *dev, phys_addr_t orig_addr,
+		unsigned char *vaddr, size_t size, size_t alloc_size,
+		unsigned int tlb_offset, enum dma_data_direction dir);
+
 /**
  * struct io_tlb_area - IO TLB memory area descriptor
  *
@@ -480,7 +484,6 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
-	unsigned long pfn = PFN_DOWN(orig_addr);
 	unsigned char *vaddr = mem->vaddr + tlb_addr - mem->start;
 	unsigned int tlb_offset, orig_addr_offset;
 
@@ -497,6 +500,34 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	}
 
 	tlb_offset -= orig_addr_offset;
+	swiotlb_copy(dev, orig_addr, vaddr, size, alloc_size, tlb_offset, dir);
+}
+
+/**
+ * swiotlb_copy() - copy swiotlb buffer content, checking for overflows.
+ * @dev:	device which has mapped the bounce buffer
+ * @orig_addr:	physical address of the original buffer
+ * @vaddr:	virtual address inside the bounce buffer
+ * @size:	number of bytes to copy
+ * @alloc_size:	total allocated size of the bounce buffer
+ * @tlb_offset:	offset within the bounce buffer
+ * @dir:	direction of the data transfer
+ *
+ * If @dir is %DMA_TO_DEVICE, copy data from the original buffer to the
+ * bounce buffer, otherwise copy from the bounce buffer to the original
+ * buffer.
+ *
+ * The original buffer may be in high memory; that's why @orig_addr is
+ * a physical address. Note that this is the address of the beginning
+ * of the bounce buffer. Copying starts at offset @tlb_offset. This is
+ * needed to check accesses beyond the allocated size.
+ */
+static void swiotlb_copy(struct device *dev, phys_addr_t orig_addr,
+		unsigned char *vaddr, size_t size, size_t alloc_size,
+		unsigned int tlb_offset, enum dma_data_direction dir)
+{
+	unsigned long pfn = PFN_DOWN(orig_addr);
+
 	if (tlb_offset > alloc_size) {
 		dev_WARN_ONCE(dev, 1,
 			"Buffer overflow detected. Allocation size: %zu. Mapping size: %zu+%u.\n",
@@ -727,15 +758,65 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
 	return used;
 }
 
+/**
+ * swiotlb_fixed_map() - allocate a bounce buffer from fixed slots
+ * @dev:	device which maps the buffer
+ * @orig_addr:	address of the original buffer
+ * @alloc_size:	total size of the original buffer
+ * @alloc_align_mask:
+ *		required physical alignment of the I/O buffer
+ * @attrs:	optional DMA attributes for the map operation
+ *
+ * Search for a suitable slot or sequence of slots and initialize them
+ * for use with the original buffer.
+ *
+ * Return: Physical address of the bounce buffer, or %DMA_MAPPING_ERROR.
+ */
+static phys_addr_t swiotlb_fixed_map(struct device *dev, phys_addr_t orig_addr,
+			size_t alloc_size, unsigned int alloc_align_mask,
+			unsigned long attrs)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
+	int index = swiotlb_find_slots(dev, orig_addr,
+				       alloc_size + offset, alloc_align_mask);
+	unsigned int i;
+
+	if (index == -1)
+		return (phys_addr_t)DMA_MAPPING_ERROR;
+
+	/*
+	 * Save away the mapping from the original address to the DMA address.
+	 * This is needed when we sync the memory.  Then we sync the buffer if
+	 * needed.
+	 */
+	for (i = 0; i < nr_slots(alloc_size + offset); i++)
+		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
+	return slot_addr(mem->start, index) + offset;
+}
+
+/**
+ * swiotlb_tbl_map_single() - map DMA buffer to a bounce buffer
+ * @dev:	device which maps the buffer
+ * @orig_addr:	address of the original buffer
+ * @mapping_size: size of the original buffer to be synced now
+ * @alloc_size:	total size of the original buffer
+ * @alloc_align_mask:
+ *		required physical alignment of the I/O buffer
+ * @dir:	direction of the data transfer
+ * @attrs:	optional DMA attributes for the map operation
+ *
+ * Create a mapping of the DMA buffer into a bounce buffer and copy the
+ * original data.
+ *
+ * Return: Physical address of the bounce buffer, or %DMA_MAPPING_ERROR.
+ */
 phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		unsigned int alloc_align_mask, enum dma_data_direction dir,
 		unsigned long attrs)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
-	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
-	unsigned int i;
-	int index;
 	phys_addr_t tlb_addr;
 
 	if (!mem || !mem->nslabs) {
@@ -753,24 +834,17 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
-	index = swiotlb_find_slots(dev, orig_addr,
-				   alloc_size + offset, alloc_align_mask);
-	if (index == -1) {
+	tlb_addr = swiotlb_fixed_map(dev, orig_addr, alloc_size,
+				     alloc_align_mask, attrs);
+
+	if (tlb_addr == (phys_addr_t)DMA_MAPPING_ERROR) {
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
-	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, mem->nslabs, mem_used(mem));
-		return (phys_addr_t)DMA_MAPPING_ERROR;
+				"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
+				alloc_size, mem->nslabs, mem_used(mem));
+		return tlb_addr;
 	}
 
-	/*
-	 * Save away the mapping from the original address to the DMA address.
-	 * This is needed when we sync the memory.  Then we sync the buffer if
-	 * needed.
-	 */
-	for (i = 0; i < nr_slots(alloc_size + offset); i++)
-		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
-	tlb_addr = slot_addr(mem->start, index) + offset;
 	/*
 	 * When dir == DMA_FROM_DEVICE we could omit the copy from the orig
 	 * to the tlb buffer, if we knew for sure the device will
-- 
2.25.1

